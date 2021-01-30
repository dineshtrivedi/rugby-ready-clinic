#!/bin/bash
function lcurrbranch {
    git rev-parse --abbrev-ref HEAD
}

function lsetup {
    git branch master --quiet --set-upstream-to origin/master
    git config branch.autosetuprebase always
    git config branch.master.rebase true
    git config branch.$(lcurrbranch).rebase true
    git config push.followTags true
    git config pull.recurseSubmodules true
}

function lpull {
    lsetup && git pull --rebase origin $(lcurrbranch) $@
}
function lpush {
    lsetup && git push origin $(lcurrbranch) $@
}
function lmerge {
    if [ $1 ]
    then
        thatbranch=$1
        thisbranch=$(lcurrbranch)
        git merge --no-ff -m "lmerge Merging $thatbranch into $thisbranch [$2]" $thatbranch
        exitcode=$?
    else
        echo 'Merging from other branch to current branch'
        echo '-----------------------------------------'
        echo 'Usage: lmerge <other_branch> [commit_msg]'
    fi
    return $exitcode
}

