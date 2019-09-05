# This file is part of "CMake Project".
#
#   "CMake Project" is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   "CMake Project" is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with "CMake Project".  If not, see <https://www.gnu.org/licenses/>.

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

#######################################################################
# Set output directories for libraries and executables
#######################################################################
set(PROJECT_BIN_DIR ${CMAKE_BINARY_DIR}/bin)
if(UNIX)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
elseif(WIN32)
  foreach(_config Debug Release)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${_config} "${PROJECT_BIN_DIR}/${_config}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${_config} "${PROJECT_BIN_DIR}/${_config}")
  endforeach()
endif()

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
