cmake_minimum_required(VERSION 3.10)
project(CodeGenLibrary)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

file(GLOB SOURCES "*.cpp")

add_library(libRTCG SHARED ${SOURCES}) 

set_target_properties(libRTCG PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_NAME "CodeGen"
)

get_target_property(LIBRARY_OUTPUT_NAME libRTCG OUTPUT_NAME)

# Construct the full path to the library
set(LIBRARY_EXTENSION "")
if(WIN32 OR MINGW)
    set(LIBRARY_EXTENSION ".dll")
else()
    set(LIBRARY_EXTENSION ".so")
endif()

# Set a variable to indicate the library's path
set(RTCG_LIBRARY_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../${LIBRARY_OUTPUT_NAME}${LIBRARY_EXTENSION}" PARENT_SCOPE)