#!/bin/bash

SITE_DIR="as_published/"
HUGO_OPTS=""

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi


## Site is copied to ovid:public_html/$branch/
## unless the branch is current
branch=$(git symbolic-ref --short HEAD)
loc="public_html/$branch"

if [ $branch = "current" ]; then
  loc="public_html/"
elif [ $branch = "next" ]; then
  HUGO_OPTS+=" -b https://depts.washington.edu/rauv/next/"
fi

echo "Deleting old publication"
rm -rf $SITE_DIR
mkdir -p $SITE_DIR

echo "Generating site"
hugo $HUGO_OPTS

echo "Branch is $branch, copying to public_html/$loc"

echo "Copying to Ovid"
rsync -e ssh -aPvc $SITE_DIR/ rauv@ovid.u.washington.edu:$loc
