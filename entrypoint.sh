#!/bin/sh -l

npm run lint
git commit -m "Linted code"
git push
