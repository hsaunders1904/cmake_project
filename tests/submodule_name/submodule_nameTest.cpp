#include "submodule_name.h"

#include <catch2/catch.hpp>

TEST_CASE("Test get hello world string", "[submodule_name]") {
  REQUIRE("Hello World!\n" == HelloWorld::get());
}
