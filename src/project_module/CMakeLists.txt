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
set(MODULE_NAME "project_module")

set(SRC_FILES
  "src/${MODULE_NAME}.cpp"
)

set(HDR_FILES
  "include/${MODULE_NAME}/${MODULE_NAME}.h"
)

add_library(${MODULE_NAME} STATIC ${SRC_FILES} ${HDR_FILES})
set_target_properties(${MODULE_NAME} PROPERTIES FOLDER "Modules")
target_include_directories(${MODULE_NAME} PRIVATE "include")


if(ENABLE_TESTS)

  set(TEST_NAMES
    "${MODULE_NAME}.Test"
  )

  foreach(_test_name ${TEST_NAMES})
    set(_test_src "src/${_test_name}.cpp")
    set(_test_case "${MODULE_NAME}.${_test_name}")
    add_executable(${_test_case} ${_test_src} ${CATCH_MAIN})
    target_link_libraries(${_test_case} ${MODULE_NAME} Catch2::Catch2)
    target_include_directories(${_test_case} PRIVATE "include")
    set_target_properties(${_test_case} PROPERTIES
      FOLDER "Tests/${MODULE_NAME}"
      RUNTIME_OUTPUT_DIRECTORY ${TESTS_BIN_DIR}
      RUNTIME_OUTPUT_DIRECTORY_DEBUG "${TESTS_BIN_DIR}/Debug"
      RUNTIME_OUTPUT_DIRECTORY_RELEASE "${TESTS_BIN_DIR}/Release")
    add_test(${_test_case} "${TESTS_BIN_DIR}/${_test_case}")
  endforeach()

endif()
