#include "package_name.h"

#include "catch.hpp"

TEST_CASE("Test get hello world string", "[package_name]") {
    REQUIRE("Hello World!\n" == HelloWorld::get());
}
