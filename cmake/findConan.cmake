set(CONAN_CMAKE_URL "https://raw.githubusercontent.com/conan-io/cmake-conan/develop/conan.cmake")
set(DESTINATION_DIR ${CMAKE_BINARY_DIR}/cmake)
file(MAKE_DIRECTORY ${DESTINATION_DIR})

# We need a Windows compatible version of this
execute_process(
  COMMAND wget ${CONAN_CMAKE_URL}
    --output-document=${DESTINATION_DIR}/conan.cmake
    --no-clobber
    --timeout=10
  OUTPUT_QUIET
  ERROR_QUIET
  RESULT_VARIABLE WGET_RESULT
  OUTPUT_VARIABLE WGET_OUTPUT)

# We need a way to notify the user if the file is not updated 
if (NOT EXISTS ${DESTINATION_DIR}/conan.cmake)
  MESSAGE(FATAL_ERROR "Could not retrive conan.cmake from '${CONAN_CMAKE_URL}': ${WGET_RESULT} - ${WGET_OUTPUT}.")
endif()

list(APPEND CMAKE_MODULE_PATH ${DESTINATION_DIR})
include(conan)
