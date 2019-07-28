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
  string(JOIN " " WIN32_FLAGS
    "/W2"                                   # Set warning level to 2
    "/experimental:external"
    "/external:I ${CMAKE_SOURCE_DIR}/lib/"  # Ignore warnings from lib
  )
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WIN32_FLAGS}")
endif()
if(UNIX)
  string(JOIN " " UNIX_FLAGS
    "--std=c++17"
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
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
add_subdirectory(test)
