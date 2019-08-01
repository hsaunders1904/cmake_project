function (download_and_build_boost)
  set(BOOST_SRC ${CMAKE_SOURCE_DIR}/external/boost)
  set(BOOST_BUILD ${CMAKE_BINARY_DIR}/external/boost)
  set(BOOST_LIST ${CMAKE_SOURCE_DIR}/CMake/boost/CMakeLists.txt.in)

  # Download and unpack boost at configure time
  configure_file(${BOOST_LIST} ${BOOST_BUILD}/CMakeLists.txt)

  # Configure step
  execute_process(COMMAND
    ${CMAKE_COMMAND} -G ${CMAKE_GENERATOR} .
    WORKING_DIRECTORY ${BOOST_BUILD}
    RESULT_VARIABLE result)
  if(result)
    message(FATAL_ERROR "Configure step for boost failed: ${result}")
  endif()

  # Build step
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build .
    WORKING_DIRECTORY ${BOOST_BUILD}
    RESULT_VARIABLE result)
  if(result)
    message(FATAL_ERROR "Build step for boost failed: ${result}")
  endif()

  # Add boost directly to our build
  # add_subdirectory(${BOOST_BUILD})
endfunction()