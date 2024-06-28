# The ability to specify the C++17 standard was added in CMake version 3.8.
cmake_minimum_required(VERSION 3.8)

# Set the project name.
project(CPPNotepad)

# Specify the C++ standard.
set(CMAKE_CXX_STANDARD 17)

# Add the main executable.
add_executable(
    main
    "src/compiler_defines.cpp"
    "src/json_settings.cpp"
    "src/main.cpp"
)

# Add the binary tree to the search path for include files.
target_include_directories(main PUBLIC "${PROJECT_SOURCE_DIR}/include")
