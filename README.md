# C++ Notepad

A collection of C++ code for testing, ideating, proof of concept, etc.

## How to build and run the code

CMake is used here. First, generate the build system.

```bash
➜ cmake -S . -B build
```

Next, build the project.

```bash
➜ cmake --build build
```

Now the built executable can be found in `build/`. To execute it, run:

```bash
➜ ./build/main
```
