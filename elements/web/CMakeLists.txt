cmake_minimum_required(VERSION 3.10)
project(PackWeb)

# Determine the platform
if(MINGW OR WIN32)
    set(OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/CodeGen.dll")
else()
    set(OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/libCodeGen.so")
endif()

# Add a custom command to run the shell script
add_custom_command(
    OUTPUT ${OUTPUT_FILE}  # Specify the output file
    COMMAND cp ${FTCG_LIBRARY_FILE} ${OUTPUT_FILE}
    COMMENT "Copy Codegen"
    DEPENDS libFTCG
)

add_custom_target(packWeb ALL DEPENDS ${OUTPUT_FILE})