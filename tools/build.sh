#!/usr/bin/env bash

function echo_and_run() {
    echo "+ $1"
    eval "$1"
}

readonly root_dir="$(realpath $(dirname "$0")/..)"
readonly build_dir="${root_dir}/build"

echo_and_run "cd ${build_dir}" && \
echo_and_run "cmake ${root_dir} -B${build_dir}" && \
echo_and_run "cmake --build ${build_dir}"
