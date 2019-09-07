# Node Code Formatter

> Automatically lints/formats your code!

## Setup :clipboard:

Simply put your code linter into a script named `lint` in your `package.json`.

**Make sure that your code linter is a dependency of your module!**

### StandardJS

```json
...
"scripts": {
    "lint": "standard --fix"
  }
```

### Prettier

```json
...
"scripts": {
    "lint": "prettier"
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
    - uses: MarvinJWendt/node-linter@master
```

3. Commit the file

### Option two

---

4. Create a `formatter.workflow` file in `.github/`
5. Paste this code into the file: 
   
```workflow
workflow "Lint code" {
  resolves = ["Lint"]
  on = "push"
}

action "Lint" {
  uses = "MarvinJWendt/node-linter@master"
  secrets = ["GITHUB_TOKEN"]
}
```

3. Commit the file