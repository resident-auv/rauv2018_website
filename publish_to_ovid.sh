#!/bin/sh

DIR=$(dirname "$0")
SITE_DIR="as_published/"

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

branch=$(git symbolic-ref --short HEAD)

echo "Deleting old publication"
rm -rf $SITE_DIR
mkdir -p $SITE_DIR
git worktree prune
rm -rf .git/worktrees/$SITE_DIR

echo "Checking out master branch into public"
git worktree add -B master $SITE_DIR origin/master

echo "Removing existing files"
rm -rf $SITE_DIR/*

echo "Generating site"
hugo

echo "Copying to Ovid"
rsync -e ssh -aPvc $SITE_DIR/ rauv@ovid.u.washington.edu:public_html/$branch
