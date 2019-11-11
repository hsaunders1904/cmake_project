#include "project_module/project_module.h"

const std::string HelloWorld::get() { return "Hello, world!"; }

const void HelloWorld::print() { std::cout << HelloWorld::get() << "\n"; }
