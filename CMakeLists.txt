cmake_minimum_required(VERSION 3.12)

# Change your executable name to something creative!
set(NAME DS18B20) # <-- Name your project/executable here!

include(pico_sdk_import.cmake)

# Gooey boilerplate
project(${NAME} C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()

# Add your source files
#add_executable(${NAME}
#    jdBlink1.cpp # <-- Add source files here!
#)

# Include required libraries
# This assumes `pimoroni-pico` is stored alongside your project
#include(../pimoroni-pico/libraries/pico_explorer/pico_explorer.cmake)
# include(../pimoroni-pico/libraries/pico_display/pico_display.cmake)

include(DS18B20pio.cmake)

# Don't forget to link the libraries you need!
#target_link_libraries(${NAME}
#	pico_stdlib
#    pico_explorer # <-- List libraries here!
#)

# create map/bin/hex file etc.
#pico_add_extra_outputs(${NAME})

add_subdirectory(src)

#Set up files for the release packages
install(CODE "execute_process(COMMAND $ENV{HOME}/bin/picoDeploy.sh ${CMAKE_CURRENT_BINARY_DIR}/src/${NAME}.elf)")

# Set up files for the release packages
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/src/${NAME}.uf2
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
)

set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY OFF)
set(CPACK_GENERATOR "ZIP" "TGZ")
include(CPack)
