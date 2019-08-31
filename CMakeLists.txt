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
# Set some useful path variables
#######################################################################
set(LIB_DIR ${CMAKE_SOURCE_DIR}/lib)

#######################################################################
# Run Conan install and import the generated target links
#######################################################################
execute_process(COMMAND conan install ${CMAKE_SOURCE_DIR} -if ${CMAKE_BINARY_DIR})
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

#######################################################################
# Set our compiler options
#######################################################################
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
if(WIN32)
  string(JOIN " " WIN32_FLAGS
    "/W4"                                        # Set warning level to 4
    "/experimental:external"                     # Enable 'external' flag
    "/external:I ${CMAKE_SOURCE_DIR}/external/"  # Ignore warnings from external libraries
  )
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WIN32_FLAGS}")
endif()
if(UNIX)
  string(JOIN " " UNIX_FLAGS
    "-Wall"
    "-pedantic"
    "-Wextra"
  )
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${UNIX_FLAGS}")
endif()

#######################################################################
# Set output directories for libraries and executables
#######################################################################
set(PROJECT_BIN_DIR ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${PROJECT_BIN_DIR}/Debug)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BIN_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_BIN_DIR}/Release)

#######################################################################
# Set our configuration options
#######################################################################
option(ENABLE_TESTS "Enable to build tests." ON)
option(ENABLE_OPEN_MP "Enable to use OpenMP." OFF)

#######################################################################
# Set the CMake module path, run our include scripts and conan
#######################################################################
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/tools/cmake)
if(ENABLE_OPEN_MP)
  include(findOpenMP)
endif()

#######################################################################
# Add subdirectories for our code
#######################################################################
add_subdirectory(src)
add_subdirectory(lib)
if(ENABLE_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()
