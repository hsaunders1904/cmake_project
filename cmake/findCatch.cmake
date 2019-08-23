set(CATCH_VERSION "2.6.0")
mark_as_advanced(CATCH_VERSION)

conan_cmake_run(
  REQUIRES "Catch2/${CATCH_VERSION}@catchorg/stable"
  BASIC_SETUP
  CMAKE_TARGETS
  BUILD_TYPE "None"
)
