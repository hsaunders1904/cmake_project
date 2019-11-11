set(EXE_NAME "cmake_project")

add_executable(${EXE_NAME} "${EXE_NAME}.main.cpp")

set(MODULES
  "project_module"
)

foreach(_module ${MODULES})
  add_subdirectory(${_module})
  target_include_directories(${EXE_NAME} PRIVATE "${_module}/include")
  target_link_libraries(${EXE_NAME} ${_module})
endforeach(_module)
