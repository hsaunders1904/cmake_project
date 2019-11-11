# !/usr/bin/python3
# # This file is part of "CMake Project".
#
#   "CMake Project" is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   "CMake Project" is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with "CMake Project".  If not, see <https://www.gnu.org/licenses/>.

import argparse
from os import makedirs, mkdir, path, walk
from shutil import copyfile

DEFAULT_PROJECT_NAME = 'cmake_project'
DEFAULT_MODULE_NAME = 'project_module'
EXCLUDE_FILES = ['README.md', 'LICENSE', 'new_project.py']


def replace_project_names(string):
    """Replace the default project/module name with user's choice"""
    string = string.replace(DEFAULT_PROJECT_NAME, project_name)
    return string.replace(DEFAULT_MODULE_NAME, module_name)


def copy_file(in_path, out_path):
    """Copy file, replacing project and module name"""
    with open(in_path, 'r') as f_in:
        file_contents = replace_project_names(f_in.read())
    with open(out_path, 'w') as f_out:
        f_out.write(file_contents)


arg_parser = argparse.ArgumentParser('CMake Project',
                                     description="Create a new CMake project.")
arg_parser.add_argument('new_project_path', type=str, default=None,
                        help="Path in which to create your new project.")
arg_parser.add_argument('--project_name', '-p', type=str, default=None,
                        help="The name for your project.")
arg_parser.add_argument('--module_name', '-m', type=str,
                        help="The name for the module in your project.")
arg_parser.add_argument('--dry_run', '-n', action='store_true',
                        help=("Show, but don't execute, actions that would be "
                              "carried out."))
arg_parser.add_argument('--yes', '-y', action='store_true',
                        help="Skip project creation confirmation.")
args = arg_parser.parse_args()

if not args.project_name:
    project_name = input("Enter a name for your project: ")
else:
    project_name = args.project_name

if not args.module_name:
    module_name = input("Enter a new name for the project module: ")
else:
    module_name = args.module_name

new_project_root = path.abspath(path.join(args.new_project_path, project_name))
repository_root = path.dirname(path.realpath(__file__))

if not args.yes:
    print(f"Do you want to create project '{project_name}' with module "
          f"'{module_name}' in directory '{new_project_root}'")
    permission = input("[y/n]: ")
    if permission.lower() not in ['y', 'yes']:
        import sys
        sys.exit()

for root, dirnames, file_names in walk(repository_root):
    dirnames[:] = [d for d in dirnames if not d.startswith(('.', 'build'))]
    rel_path = path.relpath(root, repository_root)
    new_dir_name = replace_project_names(path.join(new_project_root,
                                                   rel_path)).rstrip('./\\')
    if not path.isdir(new_dir_name):
        print(f"Creating directory: {new_dir_name}")
        if not args.dry_run:
            makedirs(new_dir_name, exist_ok=True)
    for file_name in file_names:
        if file_name in EXCLUDE_FILES:
            continue
        old_path = path.join(root, file_name)
        new_path = replace_project_names(path.join(new_dir_name, file_name))
        print(f"    {path.relpath(old_path, repository_root)} -> {new_path}")
        if not args.dry_run:
            copy_file(old_path, new_path)

build_dir = path.join(new_project_root, 'build')
if not path.isdir(build_dir):
    print(f"Creating directory: {build_dir}")
    if not args.dry_run:
        mkdir(build_dir)
