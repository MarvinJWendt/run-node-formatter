#!/bin/bash

set -e

npm install
npm run lint
git add *
git commit -m "Linted code"
git push
