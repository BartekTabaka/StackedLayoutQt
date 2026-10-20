cmake_minimum_required(VERSION 3.28)
project(StackedLayoutQt LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set_property(GLOBAL PROPERTY AUTOGEN_SOURCE_GROUP "Generated")
set_property(GLOBAL PROPERTY AUTOGEN_TARGETS_FOLDER "Autogen")

# Dependencies
include(Dependencies.cmake)

# Compilation options
add_compile_options(
    $<$<CXX_COMPILER_ID:MSVC>:/W4 /utf-8>
    $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic >
)

# Projects
add_subdirectory(StackedLayoutQt)

set_property(DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT StackedLayoutQt)
