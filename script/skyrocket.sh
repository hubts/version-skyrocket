#!/bin/bash

# Print the usage and exit
usage() {
    echo "Usage: $0 [<new_version> | major | minor | patch | premajor | preminor | prepatch | prerelease]"
    exit 1
}

# Go to root directory (location where script runs)
go_root() {
    SCRIPT_DIR=$(dirname $0)
    [[ "$SCRIPT_DIR" = "." ]] && SCRIPT_DIR=$(pwd)
    ROOT_DIR=$(dirname $SCRIPT_DIR)
    [[ "$ROOT_DIR" = "." ]] && ROOT_DIR=$(pwd)
    cd $ROOT_DIR
}

# Print the current branch of git
print_branch() {
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    echo "🎄 Your current branch is [ $branch ]"
}

# Get the current package version
get_version() {
    version=$(node -p "require('$ROOT_DIR/package.json').version")
    if (( $? != 0 )); then
        echo "😥 We cannot find your package.json in this directory: $(pwd)"
        exit 1
    fi
    echo $version
}

# Git commit
commit() {
    git add .
    git cz
    if (( $? == 0 )); then
        new_version=$(get_version)
        echo "🥰 [ $new_version ] Successfully updated and committed!"
    else
        echo "😥 Failed to commit."
        exit 1
    fi
}

bump() {
    dir="$1"
    request="$2"
    [ "$request" == "" ] && usage

    previous_version=$(get_version)
    echo $previous_version
    # new_version=$(npm version $request --no-git-tag-version)
    # if (( $? != 0 )); then
    #     new_version="$request"
    # fi
    # echo "🛫 Try to update [ $previous_version ] -> [ $new_version ]"

    # if (( $? == 0 )); then
    #     version=${new_version:1}
    #     search='(\"version\":[[:space:]]*\").+(\")'
    #     replace="\1${version}\2"
    #     # sed -i ".tmp" -E "s/${search}/${replace}/g" "package.json"
    #     # rm "package.json.tmp"
    #     sed -n -E "s/${search}/${replace}/g" "package.json"

    #     git add .
    #     git cz

    #     echo "🥰 [ $new_version ] Successfully updated and committed!"
    # else
    #     echo "😥 Failed"
    # fi
}

################################
## This script runs from here ##
################################

# 1. Go to root
go_root
echo $(pwd)

# 2. Git branch
print_branch

# 3. Run
bump $(pwd) "$1"