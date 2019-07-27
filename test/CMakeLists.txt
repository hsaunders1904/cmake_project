set(CATCH_MAIN ${CMAKE_CURRENT_SOURCE_DIR}/catchMain.cpp)

#######################################################################
# List packages we are testing and add subdirectories
#######################################################################
set(
  LIBRARIES
  package_name
)

foreach(_pckg_name ${LIBRARIES})
  add_subdirectory(${_pckg_name})
endforeach()
