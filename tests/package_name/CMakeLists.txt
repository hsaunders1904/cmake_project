set(PACKAGE_NAME package_name)
#######################################################################
# List of our tests, each should correspond to a .cpp file
#######################################################################
set(
  TEST_CASES
  package_nameTest
)

#######################################################################
# Build our tests and link to the tested package and Catch
#######################################################################
foreach(_test_case ${TEST_CASES})
  add_executable(${_test_case} ${_test_case}.cpp ${CATCH_MAIN})
  set_target_properties(${_test_case} PROPERTIES FOLDER Tests/${PACKAGE_NAME})
  target_link_libraries(${_test_case} ${PACKAGE_NAME})
  target_include_directories(${_test_case} PRIVATE
    ${CMAKE_SOURCE_DIR}/external/Catch2
    ${CMAKE_SOURCE_DIR}/src/${PACKAGE_NAME}/include
  )
  add_test(${_test_case} ${EXECUTABLE_OUTPUT_PATH}/${_test_case})
endforeach()
