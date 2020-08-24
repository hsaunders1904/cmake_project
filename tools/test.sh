#!/usr/bin/env bash

function echo_and_run() {
    echo "+ $1"
    eval "$1"
}

readonly root_dir="$(realpath $(dirname $0)/..)"
readonly build_dir="${root_dir}/build"

echo_and_run "cd build" && \
echo_and_run "./bin/cmake_project" && \
echo_and_run "ctest --output-on-failure -T Test --no-compress-output"""
