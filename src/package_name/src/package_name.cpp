#include "package_name.h"

HelloWorld::HelloWorld() {};

void HelloWorld::print() {
    std::cout << get();
}

std::string HelloWorld::get() {
    return "HelloWorld!\n";
}
