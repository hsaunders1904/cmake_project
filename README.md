# CMake Project
## A Template for an executable based C++/CMake project

This template is intended to save users' time when starting a new
multi-platform C++ project. The project layout is based on the layout put
forward by the [Pitchfork project](https://github.com/vector-of-bool/pitchfork).

There is a very basic "Hello World" program that's all set up for you. It includes a test (using Catch2 as the testing framework), the test can be run using CTest.

If you would rather not use Catch, or would like to use other packages,
other branches of this repository offer alternatives. The idea being that
you can mix-and-match and merge whichever branches you'd like to get you started on your project.

## Usage

- Clone this repository somewhere on your computer.
- Use the Python script `new_project.py` to create your new project:

    - `$ python3 new_project.py /path/to/new/project --project_name <New_Project_Name> --module_name <Your_Module_Name>`

- Now your project is ready to go!
- You can run CMake and build the project by running the following commands in the top level directory:
    - `$ cmake -B build/`
    - `$ cmake --build build/`
- Run the project's tests by executing `ctest` within the `build` directory.
