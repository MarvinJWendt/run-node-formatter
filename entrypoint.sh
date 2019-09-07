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
    npm run lint
fi

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
git config --global user.email "linter@1337z.ninja"
git config --global user.name "Node Code Linter"

git add .
rm -rf node_modules/
git commit -m "Linted code"
git push --set-upstream origin master
