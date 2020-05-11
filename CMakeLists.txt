cmake_minimum_required(VERSION 3.0.0)
project(alica-messages)

file(GLOB_RECURSE SOURCES "*.c++" "*.h")

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