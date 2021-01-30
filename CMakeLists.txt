cmake_minimum_required(VERSION 3.0.0)
project(alica-message-protos VERSION 0.0.1)

file(GLOB_RECURSE PROTOS "${CMAKE_CURRENT_SOURCE_DIR}/proto/*.capnp")
file(MAKE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/src")
foreach(PROTO ${PROTOS})
        execute_process(
                COMMAND bash -c "capnp compile \
                         --import-path=${CMAKE_CURRENT_SOURCE_DIR}/proto \
                         --src-prefix=${CMAKE_CURRENT_SOURCE_DIR}/proto \
                         --output=c++:${CMAKE_CURRENT_SOURCE_DIR}/src \
                         ${PROTO}"
        )
endforeach()

file(GLOB_RECURSE HDRS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h")
file(GLOB_RECURSE SRCS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c++")

add_library(${PROJECT_NAME} ${SRCS})
target_include_directories(${PROJECT_NAME} PUBLIC src)
target_compile_definitions(${PROJECT_NAME} PRIVATE std_cxx_17)

install(TARGETS ${PROJECT_NAME}
        ARCHIVE
            DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        LIBRARY
            DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        RUNTIME
            DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
)