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
set(CMAKE_CXX_STANDARD 17)
if(WIN32)
  string(JOIN " " WIN32_FLAGS
    "/W4"                                        # Set warning level to 4
    "/std:c++${CMAKE_CXX_STANDARD}"              # Set the C++ standard
    "/experimental:external"                     # Enable 'external' flag
    "/external:I ${CMAKE_SOURCE_DIR}/external/"  # Ignore warnings from external libraries
  )
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WIN32_FLAGS}")
endif()
if(UNIX)
  string(JOIN " " UNIX_FLAGS
    "--std=c++${CMAKE_CXX_STANDARD}"
    "-Wall"
    "-pedantic"
    "-Wextra"
  )
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${UNIX_FLAGS}")
endif()

#######################################################################
# Set output directories for libraries and exectuables
#######################################################################
set(PROJECT_BIN_DIR ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})

#######################################################################
# Set our configuration options
#######################################################################
option(ENABLE_TESTS "Enable to build tests." ON)
option(ENABLE_OPEN_MP "Enable to use OpenMP." OFF)

#######################################################################
# Set the CMake module path and run our include scripts
#######################################################################
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
if(ENABLE_OPEN_MP)
  include(findOpenMP)
endif()

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
if(ENABLE_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()
