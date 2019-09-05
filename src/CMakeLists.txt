# This file is part of "CMake Project".
#
#   "CMake Project" is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   "CMake Project" is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with "CMake Project".  If not, see <https://www.gnu.org/licenses/>.
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
