cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 11)  # or your desired standard

project(MyProject)

set(CMAKE_DISABLE_IN_SOURCE_BUILD TRUE)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)

# Find required packages
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTKMM REQUIRED gtksourceviewmm-3.0 sqlite3 gthread-2.0 gmodule-2.0)

# Set compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O1 -g -fPIC")
add_link_options(-g)

# Include directories
include_directories(${GTKMM_INCLUDE_DIRS})

# Source files for runnersrc
file(GLOB RUNNERSRC_SOURCES runnersrc/*.cpp)

# Create the runner executable
add_executable(runner ${RUNNERSRC_SOURCES})
target_link_directories(runner PRIVATE ${GTKMM_LIBRARY_DIRS})
target_link_libraries(runner PRIVATE ${GTKMM_LIBRARIES} pthread)

# Source files for src
file(GLOB SRC_SOURCES src/*.cpp)

# Create the hiasm5 executable
add_executable(hiasm5 ${SRC_SOURCES})
target_link_directories(hiasm5 PRIVATE ${GTKMM_LIBRARY_DIRS})
target_link_libraries(hiasm5 PRIVATE ${GTKMM_LIBRARIES} pthread)
