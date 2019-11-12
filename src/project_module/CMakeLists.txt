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
    target_link_libraries(${_test_case} ${MODULE_NAME}  CONAN_PKG::Catch2)
    target_include_directories(${_test_case} PRIVATE "include")
    set_target_properties(${_test_case} PROPERTIES
      FOLDER "Tests/${MODULE_NAME}"
      RUNTIME_OUTPUT_DIRECTORY ${TESTS_BIN_DIR}
      RUNTIME_OUTPUT_DIRECTORY_DEBUG "${TESTS_BIN_DIR}/Debug"
      RUNTIME_OUTPUT_DIRECTORY_RELEASE "${TESTS_BIN_DIR}/Release")
    add_test(${_test_case} "${TESTS_BIN_DIR}/${_test_case}")
  endforeach()

endif()
