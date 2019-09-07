# Node Code Formatter

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
      - uses: actions/checkout@master
      - name: Node Code Formatter
        uses: MarvinJWendt/run-node-formatter@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

3. Commit the file

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
