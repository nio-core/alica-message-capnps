cmake_minimum_required(VERSION 3.0.0)
project(alica-messages)

# Generate the source code for the capnproto messages
file(GLOB_RECURSE PROTOS "*.capnp")

message(STATUS "Generating code for capnproto messages")
execute_process(COMMAND mkdir ${CMAKE_CURRENT_SOURCE_DIR}/src)
execute_process(COMMAND 
    capnp compile 
        -I ${CMAKE_CURRENT_SOURCE_DIR}/proto 
        -oc++:${CMAKE_CURRENT_SOURCE_DIR}/src 
        ${PROTOS}
)

file(GLOB_RECURSE SOURCES "*.c++" "*.h")

message(STATUS "Building library ${PROJECT_NAME}")
add_library(${PROJECT_NAME} SHARED ${SOURCES})

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
        std_cxx_17
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        src
)

target_link_libraries(${PROJECT_NAME})