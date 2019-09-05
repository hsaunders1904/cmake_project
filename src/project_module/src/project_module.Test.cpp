// This file is part of "CMake Project".
//
//   "CMake Project" is free software: you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
//   "CMake Project" is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of the GNU General Public License
//   along with "CMake Project".  If not, see <https://www.gnu.org/licenses/>.
#include "project_module/project_module.h"

#include <catch2/catch.hpp>

TEST_CASE("HelloWorld::get returns 'Hello, World!' and new line",
          "[project_module]") {
  REQUIRE("Hello, world!" == HelloWorld::get());
}
