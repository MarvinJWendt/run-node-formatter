#!/bin/bash

set -e

REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")

echo "## Your environment is not ready yet. Installing modules..."
if [ -f yarn.lock ]; then
    yarn --non-interactive --silent --ignore-scripts --production=false
    yarn install
    yarn run lint
else
    NODE_ENV=development 
    npm install
    # npm run lint
fi

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
git config --global user.email "action@github.com"
git config --global user.name "GitHub Action"

echo "Hello World" >> test.txt

git add *
git commit -m "Linted code"
git push --set-upstream origin master
