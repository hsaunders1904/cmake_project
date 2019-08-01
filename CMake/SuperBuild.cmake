include(ExternalProject)

set (DEPENDENCIES)
set (EXTRA_CMAKE_ARGS)

#######################################################################
# Find/download and link Boost
#######################################################################
set(BOOST_VERSION "1.70.0")
string(REPLACE "." "_" BOOST_VERSION_UNDERSCORE ${BOOST_VERSION})
if(WIN32)
    set(BOOTSTRAP_CMD "./bootstrap.bat")
elseif(UNIX)
    set(BOOTSTRAP_CMD "./bootstrap.sh")
endif()
# Use static linking to avoid issues with system-wide installations of Boost.
list (APPEND DEPENDENCIES boost)
ExternalProject_Add (boost
  URL http://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_UNDERSCORE}.tar.bz2/download
  CONFIGURE_COMMAND ${BOOTSTRAP_CMD} --with-libraries=atomic,date_time,filesystem,program_options,system,thread
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/external/boost"
  BINARY_DIR "${CMAKE_BINARY_DIR}/external/boost"
  BUILD_COMMAND ./b2 link=static
  INSTALL_COMMAND ""
  )
list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${CMAKE_CURRENT_BINARY_DIR}/lib/boost
  -DBoost_NO_SYSTEM_PATHS=ON)