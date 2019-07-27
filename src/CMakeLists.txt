#######################################################################
# Create our main executable
#######################################################################
add_executable(${PROJECT_NAME} cmake_project.cpp)

#######################################################################
# Add directories for our own libraries and link them to the main
# executable
#######################################################################
set(
  LIBRARIES
  package_name
)

foreach(_lib_name ${LIBRARIES})
  add_subdirectory(${_lib_name})
  target_include_directories(${PROJECT_NAME} PRIVATE ${_lib_name}/include)
  target_link_libraries(${PROJECT_NAME} ${_lib_name})
endforeach()
