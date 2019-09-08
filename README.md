# Node Code Formatter

[![GitHub Action](https://img.shields.io/badge/-GitHub_Action-black?logo=github&style=flat-square)](https://github.com/marketplace/actions/node-code-formatter)
[![GitHub license](https://img.shields.io/github/license/MarvinJWendt/run-node-formatter?style=flat-square)](https://github.com/MarvinJWendt/run-node-formatter/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/MarvinJWendt/run-node-formatter)](https://github.com/MarvinJWendt/run-node-formatter/issues)
[![GitHub stars](https://img.shields.io/github/stars/MarvinJWendt/run-node-formatter?style=flat-square)](https://github.com/MarvinJWendt/run-node-formatter/stargazers)

> Automatically formats your code!

## Usage :pencil2:

1. Create a `formatter.yml` file in `.github/workflows/`
2. Paste this code into the file:

```yml
on: push
name: Node Code Formatter
jobs:
  lint:
    name: Node Code Formatter
    runs-on: ubuntu-latest
    steps:
    - name: Node Code Formatter
      uses: MarvinJWendt/run-node-formatter@1.2.1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

3. Commit the file :twisted_rightwards_arrows:

## Setup formatter scripts :clipboard:

Simply put your code formatter into a script named `format` or `lint` in your `package.json` (Yarn only supports a `format` script at the moment).

**Make sure that your code formatter is a dependency of your module!**

### StandardJS

```json
...
"scripts": {
    "format": "standard --fix"
  }
```

### Prettier

```json
...
"scripts": {
    "format": "prettier"
  }
```
