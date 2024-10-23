cmake_minimum_required(VERSION 3.10)
project(CodeGenLibrary)

# Determine the platform
if(MINGW OR WIN32)
    set(SCRIPT_TO_RUN "${CMAKE_CURRENT_SOURCE_DIR}/make_msys.sh")
    set(OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/CodeGen.dll")
else()
    set(SCRIPT_TO_RUN "${CMAKE_CURRENT_SOURCE_DIR}/make_unix.sh")
    set(OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/libCodeGen.so")
endif()

message(INFO "PREASE READ : ${OUTPUT_FILE} -----------------------------")

# Add a custom command to run the shell script
add_custom_command(
    OUTPUT ${OUTPUT_FILE}  # Specify the output file
    COMMAND ${SCRIPT_TO_RUN}
    COMMENT "Running FPC to buld FTCG"
    IMPLICIT_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/GCTShare.pas ${CMAKE_CURRENT_SOURCE_DIR}/CodeGen.dpr
)

# Create a custom target that depends on the output file
add_custom_target(libFTCG ALL DEPENDS ${OUTPUT_FILE})
# Set a variable to indicate the library's path
set(FTCG_LIBRARY_FILE ${OUTPUT_FILE} PARENT_SCOPE)