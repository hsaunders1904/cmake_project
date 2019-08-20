import os

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

PROJECT_NAME = "cmake_project"
SUBMODULE_NAME = "submodule_name"

NEW_PROJECT_NAME = input("Enter a new name for your project: ")
NEW_SUBMODULE_NAME = input("Enter a new name for the submodule in your project: ")
print(
    "Do you want to create a project '{}' containing submodule '{}'?"
    "".format(NEW_PROJECT_NAME, NEW_SUBMODULE_NAME)
)
permission = input("[y/n]: ")
if permission.lower() != "y":
    import sys

    sys.exit()


def move_file(old_path, new_path):
    os.makedirs(os.path.dirname(new_path), exist_ok=True)
    os.rename(old_path, new_path)
    if not os.listdir(os.path.dirname(old_path)):
        os.removedirs(os.path.dirname(old_path))


def replace_file_contents(file_path, new_contents):
    with open(file_path, "w") as f:
        f.write(new_contents)


def read_file_contents(file_path):
    with open(file_path, "r") as f:
        return f.read()


def replace_substrings_in_string(string, old_substrings, new_substrings):
    for old_substring, new_substring in zip(old_substrings, new_substrings):
        string = string.replace(old_substring, new_substring)
    return string


# Change working directory to base of project - it just makes things easier
os.chdir(BASE_DIR)

files_to_search = ["CMakeLists.txt"]
for directory in ["src", "tests"]:
    for root, _, file_names in os.walk(directory):
        for file_name in file_names:
            path = os.path.join(root, file_name)
            files_to_search.append(path)

for file_path in files_to_search:
    # Replace files' contents
    contents = read_file_contents(file_path)
    new_contents = replace_substrings_in_string(
        contents, [PROJECT_NAME, SUBMODULE_NAME],
        [NEW_PROJECT_NAME, NEW_SUBMODULE_NAME]
    )
    if new_contents != contents:
        replace_file_contents(file_path, new_contents)

    # Rename files
    new_path = file_path.replace(PROJECT_NAME, NEW_PROJECT_NAME)
    new_path = new_path.replace(SUBMODULE_NAME, NEW_SUBMODULE_NAME)
    if new_path != file_path:
        print(file_path + " -> " + new_path)
        move_file(old_path=file_path, new_path=new_path)
