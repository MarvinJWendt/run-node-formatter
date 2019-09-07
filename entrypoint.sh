#!/bin/bash

set -e

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

git add *
git commit -m "Linted code"
git push
