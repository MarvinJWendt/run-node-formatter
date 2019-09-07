#!/bin/bash

set -e

REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")

echo "## Initializing git repo..."
git init
echo "### Adding git remote..."
git remote add origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
echo "### git fetch..."
git fetch
echo "### checkout $GITHUB_REF..."
git checkout $GITHUB_REF

echo "## Login into git..."
git config --global user.email "formatter@1337z.ninja"
git config --global user.name "Node Code Formatter"

echo "## Your environment is not ready yet. Installing modules..."
if [ -f yarn.lock ]; then
    yarn --non-interactive --silent --ignore-scripts --production=false
    echo "## Installing dependencies..."
    yarn install
    echo "## Linting code..."
    yarn run lint
else
    echo "## Setting environment variables..."
    NODE_ENV=development 
    echo "## Installing dependencies..."
    npm install
    echo "## Linting code..."
    npm run lint --if-present
    npm run format --if-present
fi

echo "## Deleting node_modules..."
rm -rf node_modules/
echo "## Staging changes..."
git add .
echo "## Commiting files..."
git commit -m "Formatted code"
echo "## Pushing"
git push -u origin $GITHUB_REF
