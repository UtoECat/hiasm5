cmake_minimum_required(VERSION 3.10)
project(MyProject)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)

# Find required packages
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTKMM REQUIRED gtksourceviewmm-3.0)
pkg_check_modules(SQLITE3 REQUIRED sqlite3)
pkg_check_modules(GTHREAD REQUIRED gthread-2.0)
pkg_check_modules(GMODULE REQUIRED gmodule-2.0)

# Set compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O1 -g -fPIC")
add_link_options(-g)

# Include directories
include_directories(${GTKMM_INCLUDE_DIRS} ${SQLITE3_INCLUDE_DIRS} ${GTHREAD_INCLUDE_DIRS} ${GMODULE_INCLUDE_DIRS})

# Source files for runnersrc
file(GLOB RUNNERSRC_SOURCES runnersrc/*.cpp)

# Create the runner executable
add_executable(runner ${RUNNERSRC_SOURCES})
target_link_libraries(runner ${GTKMM_LIBRARIES} sqlite3 pthread ${GMODULE_LIBRARIES})

# Source files for src
file(GLOB SRC_SOURCES src/*.cpp)

# Create the hiasm5 executable
add_executable(hiasm5 ${SRC_SOURCES})
target_link_libraries(hiasm5 ${GTKMM_LIBRARIES} ${GMODULE_LIBRARIES} ${GTHREAD_LIBRARIES} sqlite3)
