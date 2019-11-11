# `src`

This directory contains your main compilable source code. This should also
contain any private include files.

The `CMakeLists.txt` in this file creates the target for our main executable, which we statically link to our module.

If you create any more modules for your project, that are required by the
main executable, you can add the name of the module to the `MODULES`
list. If the module has a similar setup to the module already in this
directory it will link automatically.
