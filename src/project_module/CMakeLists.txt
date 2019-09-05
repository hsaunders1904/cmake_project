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
set(MODULE_NAME "project_module")

set(FILE_NAMES
  "${MODULE_NAME}"
)

foreach(_file_name ${FILE_NAMES})
  list(APPEND SRC_FILES "src/${_file_name}.cpp")
  list(APPEND HDR_FILES "include/${MODULE_NAME}/${_file_name}.h")
endforeach()

add_library(${MODULE_NAME} STATIC ${SRC_FILES} ${HDR_FILES})
set_target_properties(${MODULE_NAME} PROPERTIES FOLDER "Modules")
target_include_directories(${MODULE_NAME} PRIVATE "include")
