#include "cmake_project.h"
#include "submodule_name.h"

boost::posix_time::ptime getUTCTime() {
  return boost::posix_time::second_clock::universal_time();
}

int main() {
  HelloWorld::print();
  std::cout << "The time is: " << getUTCTime() << "\n";
  return 0;
}
