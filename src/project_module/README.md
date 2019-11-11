# `project_module`

The `CMakeLists.txt` in this directory creates a library from the module
that can be linked to. It also creates targets for unit tests for the
module and adds them to CTest.

To add source and header files to the module, simply add them to the
`SRC_FILES` and `HDR_FILES` list. To add unit test files, add them to the
`TEST_NAMES` list.

Given a source file `<MyFile>.cpp` the header should be `<MyFile>.h` and
the test file `<MyFile>.Test.cpp`.
