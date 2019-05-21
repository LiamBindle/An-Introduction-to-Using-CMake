cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(Part2 C)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release" 
		CACHE STRING
		"Choose the type of build, options are: Debug Release."
		FORCE
	)
endif()

message(STATUS "Current built type: ${CMAKE_BUILD_TYPE}")

message(STATUS "The current value of VAR1 is \"${VAR1}\"")

if(NOT "${VAR1}" STREQUAL "FOO")
	message(FATAL_ERROR "You haven't set CMake variable VAR1 to FOO.\n    Set VAR1 to \"FOO\"")
else()
	message(STATUS "VAR1 is set correctly!")
endif()

message(STATUS "The current value of VAR2 is \"${VAR2}\"")

if(NOT "${VAR2}" STREQUAL "BAR")
    message(FATAL_ERROR "You haven't set CMake variable VAR2 to BAR.\n    Set VAR2 to \"BAR\"")
else()
	message(STATUS "VAR2 is set correctly!")
endif()


add_executable(part2
    part2.c
)

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    target_compile_definitions(part2 PRIVATE LRB_DEBUG)
endif()