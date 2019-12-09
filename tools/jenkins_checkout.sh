#!/usr/bin/env bash
#
# This bash script checks out a given ref from GitHub.
# The script requires a GitHub webhook JSON as an argument

error() {
  echo "Error: $@" 1>&2
}

fail() {
  error "$@"
  exit 1
}

if [ "$#" -lt 2 ]; then
    fail "No webhook JSON provided to the script"
fi

# json="$1"
# remote=$(echo "$json" | jq -r '.pull_request.base.repo.git_url')
# ref="pull/$(echo "$json" | jq -r '.pull_request.number')/merge"

remote="$1"
ref="$2"
new_branch_name="tmp_branch"

echo "Fetching '$ref' from '$remote'..."

git fetch $remote $ref:$new_branch_name &&
git checkout -- . &&
git checkout "$new_branch_name"
