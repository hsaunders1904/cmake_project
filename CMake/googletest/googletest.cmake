function (download_and_build_gtest)
  set(GTEST_SRC ${CMAKE_SOURCE_DIR}/external/googletest)
  set(GTEST_BUILD ${CMAKE_BINARY_DIR}/external/googletest)
  set(GTEST_LIST ${CMAKE_SOURCE_DIR}/CMake/googletest/CMakeLists.txt.in)

  # Download and unpack googletest at configure time
  configure_file(${GTEST_LIST} ${GTEST_BUILD}/CMakeLists.txt)

  execute_process(COMMAND
    ${CMAKE_COMMAND} -G ${CMAKE_GENERATOR} .
    WORKING_DIRECTORY ${GTEST_BUILD}
    RESULT_VARIABLE result)
  if(result)
    message(FATAL_ERROR "Configure step for googletest failed: ${result}")
  endif()
  execute_process(COMMAND
    ${CMAKE_COMMAND} --build .
    WORKING_DIRECTORY ${GTEST_BUILD}
    RESULT_VARIABLE result)
  if(result)
    message(FATAL_ERROR "Build step for googletest failed: ${result}")
  endif()

  # Prevent GoogleTest from overriding our compiler/linker options
  # when building with Visual Studio
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

  # Add googletest directly to our build. This adds
  # the following targets: gtest, gtest_main, gmock
  # and gmock_main
  add_subdirectory(${GTEST_SRC} ${GTEST_BUILD})
endfunction()
