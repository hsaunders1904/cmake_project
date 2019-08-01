#######################################################################
# Set CMake required version and project name
#######################################################################
set(CMAKE_MINIMUM_REQUIRED_VERSION 3.5)
cmake_minimum_required(VERSION ${CMAKE_MINIMUM_REQUIRED_VERSION})
set(PROJECT_NAME cmake_project)

#######################################################################
# Super build builds external dependencies (see CMake/SuperBuild.cmake)
#######################################################################
# option (USE_SUPERBUILD "Whether or not a superbuild should be invoked" OFF)
# if(USE_SUPERBUILD)
#   project(${PROJECT_NAME}-SUPERBUILD)
#   include (${CMAKE_SOURCE_DIR}/CMake/SuperBuild.cmake)
#   return()
# endif()

#######################################################################
# Set project name and some CMake settings
#######################################################################
project(${PROJECT_NAME} VERSION 0.0.1)
message(STATUS "Configuring ${PROJECT_NAME}")

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

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
option(BUILD_TESTS "Enable to build tests.")
# option(ENABLE_BOOST "Enable boost - download if its not already installed.")
# cmake_dependent_option(BOOST_LOCATION "Your boost installations root directory.")

######################################################################
# Setup the path to load CMake macros, and extra CMake files.
# This means cmake can 'see' or 'use' files in the CMake folder.
######################################################################
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)

#######################################################################
# Find and include external libraries
#######################################################################
include(ExternalProject)

# GTest
set(GTEST_VERSION "1.8.1")
include(${CMAKE_SOURCE_DIR}/CMake/googletest/googletest.cmake)
download_and_build_gtest()
set_target_properties(gmock gmock_main PROPERTIES FOLDER External/GMock)
set_target_properties(gtest gtest_main PROPERTIES FOLDER External/GTest)

# Boost
set(BOOST_VERSION 1.69.0)
string(REPLACE "." "_" BOOST_VERSION_UNDERSCORE ${BOOST_VERSION})
set(BOOST_SUBMODULES
  tools/build  # we need this to build
  libs/program_options)
string(REPLACE ";" " " BOOST_SUBMODULES_STR "${BOOST_SUBMODULES}")
string(JOIN " && " BOOST_CONF_CMD
  "cd ${CMAKE_SOURCE_DIR}/external/boost/tools/build && bootstrap.bat"
  "cd ${CMAKE_SOURCE_DIR}/external/boost/libs/program_options && bootstrap.bat"
)
string(JOIN " && " BOOST_BUILD_CMD
  "cd ${CMAKE_SOURCE_DIR}/external/boost/tools/build && b2 link=static install"
  "cd ${CMAKE_SOURCE_DIR}/external/boost/libs/program_options && b2 link=static install")
include(${CMAKE_SOURCE_DIR}/CMake/boost/boost.cmake)
download_and_build_boost()

# set(BOOST_VERSION "1.70.0")
# set(BOOST_MODULES
#   algorithm
# )
# ExternalProject_Add(boost
#   GIT_REPOSITORY    https://github.com/boostorg/boost.git
#   GIT_TAG           boost-${BOOST_VERSION}
#   SOURCE_DIR        "${CMAKE_SOURCE_DIR}/lib/boost"
#   BINARY_DIR        "${CMAKE_BINARY_DIR}/lib/boost"
#   CONFIGURE_COMMAND ""
#   BUILD_COMMAND     ""
#   INSTALL_COMMAND   ""
#   TEST_COMMAND      ""
#   GIT_SUBMODULES    ${BOOST_MODULES}
# )

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
if(BUILD_TESTS)
  add_subdirectory(test)
endif()
