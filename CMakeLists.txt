#######################################################################
# Set CMake required version, project name and CMake settings
#######################################################################
set(CMAKE_MINIMUM_REQUIRED_VERSION 3.5)
cmake_minimum_required(VERSION ${CMAKE_MINIMUM_REQUIRED_VERSION})

set(PROJECT_NAME cmake_project)
project(${PROJECT_NAME} VERSION 0.0.1)
message(STATUS "Configuring ${PROJECT_NAME}")

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

#######################################################################
# Set our compiler options
#######################################################################
set(CMAKE_CXX_STANDARD 14)

#######################################################################
# Set our configuration options
#######################################################################
option(ENABLE_TESTS "Enable to build tests." ON)

#######################################################################
# Set output directories for libraries and executables
#######################################################################
set(PROJECT_BIN_DIR ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
if(WIN32)
  foreach(_config Debug Release)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${_config} "${PROJECT_BIN_DIR}/${_config}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${_config} "${PROJECT_BIN_DIR}/${_config}")
  endforeach()
endif()

#######################################################################
# Enable testing if required and set some useful variables
#######################################################################
if(ENABLE_TESTS)
  find_package(Catch2 REQUIRED)
  enable_testing()
  set(CATCH_MAIN "${CMAKE_SOURCE_DIR}/tests/catchMain.cpp")
  set(TESTS_BIN_DIR "${CMAKE_BINARY_DIR}/tests/bin")
endif()

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
