#######################################################################
# Create our main executable
#######################################################################
add_executable(${PROJECT_NAME} cmake_project.cpp)

#######################################################################
# Add directories for our own submodules and link them to the main
# executable
#######################################################################
set(
  SUBMODULES
  submodule_name
)

foreach(_submodule_name ${SUBMODULES})
  add_subdirectory(${_submodule_name})
  target_include_directories(${PROJECT_NAME} PRIVATE ${_submodule_name}/include)
  target_link_libraries(${PROJECT_NAME} ${_submodule_name})
endforeach()
