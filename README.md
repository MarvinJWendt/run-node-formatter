# Node Code Formatter

> Automatically formats your code!

## Setup :clipboard:

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

## Usage :pencil2:

### Option one

---

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

### Option two

---

4. Create a `formatter.workflow` file in `.github/`
5. Paste this code into the file: 
   
```workflow
workflow "Node Code Formatter" {
  resolves = ["Format"]
  on = "push"
}

action "Node Code Formatter" {
  uses = "MarvinJWendt/run-node-formatter@master"
  secrets = ["GITHUB_TOKEN"]
}
```

3. Commit the file