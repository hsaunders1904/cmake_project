set(PACKAGE_NAME package_name)
message(STATUS "Configuring targets for: ${PACKAGE_NAME}")
#######################################################################
# Create our library
#######################################################################
set(
  SRC_FILES
  src/package_name.cpp
)

# Listing the header files here isn't needed for building but helps
# IDEs find them
set(
  HDR_FILES
  include/package_name.h
)

add_library(${PACKAGE_NAME} SHARED STATIC ${SRC_FILES} ${HDR_FILES})
set_target_properties(${PACKAGE_NAME} PROPERTIES FOLDER Libraries)
target_include_directories(${PACKAGE_NAME} PRIVATE include)
