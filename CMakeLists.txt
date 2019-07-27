#######################################################################
# Set CMake required version and project name
#######################################################################
set(CMAKE_MINIMUM_REQUIRED_VERSION 3.5)
cmake_minimum_required(VERSION ${CMAKE_MINIMUM_REQUIRED_VERSION})

set(PROJECT_NAME cmake_project)
project(${PROJECT_NAME} VERSION 0.0.1)
message(STATUS "Configuring ${PROJECT_NAME}")

#######################################################################
# Set our compiler options
#######################################################################
set(CMAKE_CXX_STANDARD 17)
if(WIN32)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W2")
endif()
if(UNIX)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wall")
endif()

#######################################################################
# Set output directories for libraries and exectuables
#######################################################################
set(PROJECT_BIN_DIR ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
add_subdirectory(test)
