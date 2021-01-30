#!/bin/bash
export RESTORE='\033[0m'
export RED='\033[00;31m'
export GREEN='\033[00;32m'
export YELLOW='\033[00;33m'

export PROJ_BASE="$(dirname "${BASH_SOURCE[0]}")"
CD=$(pwd)
cd "$PROJ_BASE"
export PROJ_BASE=$(pwd)
cd "$CD"

. "$PROJ_BASE/helpers/git_aliases.sh"


devhelp() {
    echo -e "${GREEN}npm run start${RESTORE} - Run the application"
}

_create_git_aliases() {
    git config alias.co checkout
    git config alias.st status
    git config alias.ci commit
    git config alias.br branch
    git config alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
}

echo_red() {
    echo -e "${RED}$1${RESTORE}";
}

echo_green() {
    echo -e "${GREEN}$1${RESTORE}";
}

echo_yellow() {
    echo -e "${YELLOW}$1${RESTORE}";
}

_create_git_aliases

nvm install

echo_green ""
echo_green "Welcome to rugby-ready dev env"
echo_green "Hint: autocomplete works for the commands below ;)"
echo_red   "-------------------------------------------------------------------------"
devhelp