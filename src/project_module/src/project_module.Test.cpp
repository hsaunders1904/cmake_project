#include "project_module/project_module.h"

#include <catch2/catch.hpp>

TEST_CASE("HelloWorld::get returns 'Hello, World!'",
          "[project_module]") {
  REQUIRE("Hello, world!" == HelloWorld::get());
}
