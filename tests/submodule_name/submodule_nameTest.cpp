#include "submodule_name.h"

#include <catch2/catch.hpp>

TEST_CASE("HelloWorld::get returns Hello World", "[submodule_name]") {
  REQUIRE("Hello World!\n" == HelloWorld::get());
}
