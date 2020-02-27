#!/usr/bin/env bash

function echo_and_run() {
    echo "+ $1"
    eval "$1"
}

readonly root_dir="$(realpath $(dirname $0)/..)"
readonly build_dir="${root_dir}/build"
readonly install_dir="${build_dir}/install"

echo_and_run "cd ${build_dir}"
echo_and_run "cmake ${root_dir} -DCMAKE_INSTALL_PREFIX=${install_dir}"
echo_and_run "cmake --build ${build_dir} --target install"
echo_and_run "ar -czvf cmake_project.tar.gz ${install_dir}"
