cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(Part3 C)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release" 
		CACHE STRING
		"Choose the type of build, options are: Debug Release."
		FORCE
	)
endif()

find_package(NetCDF REQUIRED)

add_executable(part3
    part3.c
)

target_include_directories(part3 PRIVATE ${NETCDF_INCLUDE_DIRS})
target_link_libraries(part3 PRIVATE ${NETCDF_LIBRARIES})