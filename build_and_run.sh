#! /bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]:-$0}")" || exit 1; pwd -P )
BUILD_DIR_NAME="build"
BUILD_PATH="${PARENT_PATH}/${BUILD_DIR_NAME}"

print_help() {
    echo "Usage: ${BASH_SOURCE[0]} [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --clean     Delete the ${BUILD_DIR_NAME} dir and build from scratch."
    echo "  --help      Show this message and exit."
}

DO_CLEAN=0

process_args() {
    if [ "$1" == "--help" ]; then
        print_help
        exit 0
    fi

    local arg=1

    for var in "$@"
    do
        ((arg++))
        case $var in
            "--clean")
                DO_CLEAN=1
                ;;
        esac
    done
}

process_args "$@"

cd "$PARENT_PATH" || exit 1

if [ $DO_CLEAN -eq 1 ]; then
    rm -rf "$BUILD_PATH"
    cmake -S . -B "$BUILD_PATH"
fi

cmake --build "$BUILD_PATH"

"$BUILD_PATH"/main
