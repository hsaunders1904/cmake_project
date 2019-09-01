#######################################################################
# Create our main executable
#######################################################################
set(
  HDR_FILES
  ${INC_DIR}/cmake_project.h
)

set(
  SRC_FILES
  cmake_project.cpp
)

add_executable(${PROJECT_NAME} ${SRC_FILES} ${HDR_FILES})
target_link_libraries(${PROJECT_NAME} CONAN_PKG::boost)

#######################################################################
# Add directories for our submodules and link them to the main
# executable
#######################################################################
set(
  SUBMODULES
  submodule_name
)

foreach(_submodule_name ${SUBMODULES})
  target_include_directories(${PROJECT_NAME} PRIVATE
    ${INC_DIR}
    ${LIB_DIR}/${_submodule_name}/include)
  target_link_libraries(${PROJECT_NAME} ${_submodule_name})
endforeach()
