set(SUBMODULE_NAME submodule_name)
#######################################################################
# List of our tests, each should correspond to a .cpp file
#######################################################################
set(
  TEST_CASES
  submodule_nameTest
)

#######################################################################
# Build our tests and link to the tested submodule and Catch
#######################################################################
foreach(_test_case ${TEST_CASES})
  add_executable(${_test_case} ${_test_case}.cpp ${CATCH_MAIN})
  target_link_libraries(${_test_case} ${SUBMODULE_NAME})
  target_include_directories(${_test_case} PRIVATE
    ${CMAKE_SOURCE_DIR}/external/Catch2/include
    ${LIB_DIR}/${SUBMODULE_NAME}/include
  )
  set_target_properties(${_test_case} PROPERTIES
    FOLDER Tests/${PACKAGE_NAME}
    RUNTIME_OUTPUT_DIRECTORY ${TESTS_BIN_DIR}
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${TESTS_BIN_DIR}/Debug
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${TESTS_BIN_DIR}/Release
  )
  add_test(${_test_case} ${TESTS_BIN_DIR}/${_test_case})
endforeach()
