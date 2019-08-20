set(SUBMODULE_NAME submodule_name)
message(STATUS "Configuring targets for: ${SUBMODULE_NAME}")
#######################################################################
# Create our library
#######################################################################
set(
  SRC_FILES
  src/submodule_name.cpp
)

# Listing the header files here isn't needed for building but helps
# IDEs find them
set(
  HDR_FILES
  include/submodule_name.h
)

add_library(${SUBMODULE_NAME} SHARED STATIC ${SRC_FILES} ${HDR_FILES})
set_target_properties(${SUBMODULE_NAME} PROPERTIES FOLDER Libraries)
target_include_directories(${SUBMODULE_NAME} PRIVATE include)
