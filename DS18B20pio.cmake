# Add library cpp files
add_library(ds18b20pio INTERFACE)
target_sources(ds18b20pio INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/src/DS18B20.cpp
)

pico_generate_pio_header(ds18b20pio
         ${CMAKE_CURRENT_LIST_DIR}/src/DS1820.pio)

# Add include directory
target_include_directories(ds18b20pio INTERFACE 
	${CMAKE_CURRENT_LIST_DIR}/src
)

# Add the standard library to the build
target_link_libraries(ds18b20pio INTERFACE pico_stdlib hardware_gpio hardware_pio)

