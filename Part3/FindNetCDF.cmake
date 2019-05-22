#[[ FindNetCDF.cmake

This module finds NetCDF-C and NetCDF-F. It uses nc-config and nf-config to
get HINTS for the find_xxxx's that are used to find the files/directories 
listed below.

If a file or directory cannot be found, the user should add the appropriate
directories to CMAKE_PREFIX_PATH.

Resulting variables:
    NETCDF_F_LIBRARY:       Path to libnetcdff.so
    NETCDF_C_LIBRARY:       Path to libnetcdf.so
    NETCDF_C_INCLUDE_DIR:   Path to the directory containing netcdf.h
    NETCDF_F90_INCLUDE_DIR: Path to the directory containing netcdf.mod
    NETCDF_F77_INCLUDE_DIR: Path to the directory containing netcdf.inc

    NETCDF_LIBRARIES:       Paths to all of NetCDF's libraries
    NETCDF_INCLUDE_DIRS:    Paths to all of NetCDF's include directories.

Notes:
    - This is modified to that NetCDF won't be found automatically

]]

# Find netcdf.h
find_path(NETCDF_C_INCLUDE_DIR
    netcdf.h
    DOC "Directory containing \"netcdf.h\""
    HINTS ${CMAKE_PREFIX_PATH}
    PATH_SUFFIXES
        "include"
        
    NO_DEFAULT_PATH
    NO_CMAKE_ENVIRONMENT_PATH
    NO_CMAKE_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
    NO_CMAKE_FIND_ROOT_PATH
)

# Find netcdf.mod
find_path(NETCDF_F90_INCLUDE_DIR
    netcdf.mod
    DOC "Directory containing \"netcdf.mod\""
    HINTS ${CMAKE_PREFIX_PATH}
    PATH_SUFFIXES
        "include"
        "mod"
        "module"
        
    NO_DEFAULT_PATH
    NO_CMAKE_ENVIRONMENT_PATH
    NO_CMAKE_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
    NO_CMAKE_FIND_ROOT_PATH
)

# Find netcdf.inc
find_path(NETCDF_F77_INCLUDE_DIR
    netcdf.inc
    DOC "Directory containing \"netcdf.inc\""
    HINTS ${CMAKE_PREFIX_PATH}
    PATH_SUFFIXES
        "include"
        "mod"
        "module"
        
    NO_DEFAULT_PATH
    NO_CMAKE_ENVIRONMENT_PATH
    NO_CMAKE_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
    NO_CMAKE_FIND_ROOT_PATH
)

# Find libnetcdf.so
find_library(NETCDF_C_LIBRARY
    netcdf
    DOC "Path to \"libnetcdf\""
    HINTS ${CMAKE_PREFIX_PATH}
    PATH_SUFFIXES
        "lib"

    NO_DEFAULT_PATH
    NO_CMAKE_ENVIRONMENT_PATH
    NO_CMAKE_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
    NO_CMAKE_FIND_ROOT_PATH
)

# Find libnetcdff.so
find_library(NETCDF_F_LIBRARY
    netcdff
    DOC "Path to \"libnetcdff\""
    HINTS ${CMAKE_PREFIX_PATH}
    PATH_SUFFIXES
        "lib"
        
    NO_DEFAULT_PATH
    NO_CMAKE_ENVIRONMENT_PATH
    NO_CMAKE_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
    NO_CMAKE_FIND_ROOT_PATH
)

# Make a readable error message 
set(NetCDF_ERRMSG "\nCouldn't find the following directories files:")
if(NOT NETCDF_F_LIBRARY)
    set(NetCDF_ERRMSG "${NetCDF_ERRMSG}
    NETCDF_F_LIBRARY: Path to \"libnetcdff.so\"")
endif()
if(NOT NETCDF_C_LIBRARY)
    set(NetCDF_ERRMSG "${NetCDF_ERRMSG}
    NETCDF_C_LIBRARY: Path to \"libnetcdf.so\"")
endif()
if(NOT NETCDF_C_INCLUDE_DIR)
    set(NetCDF_ERRMSG "${NetCDF_ERRMSG}
    NETCDF_C_INCLUDE_DIR: Directory containing \"netcdf.h\"")
endif()
if(NOT NETCDF_F90_INCLUDE_DIR)
    set(NetCDF_ERRMSG "${NetCDF_ERRMSG}
    NETCDF_F90_INCLUDE_DIR: Directory containing \"netcdf.mod\"")
endif()
if(NOT NETCDF_F77_INCLUDE_DIR)
    set(NetCDF_ERRMSG "${NetCDF_ERRMSG}
    NETCDF_F77_INCLUDE_DIR: Directory containing \"netcdf.inc\"")
endif()
set(NetCDF_ERRMSG "${NetCDF_ERRMSG}\n\n Set CMAKE_PREFIX_PATH to a semicolon-separated list of directories with these files.\n\n")

# Conform to the find_package standards
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args(NetCDF
    REQUIRED_VARS 
        NETCDF_F_LIBRARY 
        NETCDF_C_LIBRARY
        NETCDF_C_INCLUDE_DIR 
        NETCDF_F90_INCLUDE_DIR 
        NETCDF_F77_INCLUDE_DIR 
    FAIL_MESSAGE "${NetCDF_ERRMSG}"
)

# Set NETCDF_LIBRARIES NETCDF_INCLUDE_DIRS
set(NETCDF_LIBRARIES ${NETCDF_F_LIBRARY} ${NETCDF_C_LIBRARY})
set(NETCDF_INCLUDE_DIRS ${NETCDF_F90_INCLUDE_DIR} ${NETCDF_F77_INCLUDE_DIR} ${NETCDF_C_INCLUDE_DIR})
