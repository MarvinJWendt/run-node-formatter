# Node Code Linter

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

## Usage :octocat:

1. Create an `lint.workflow` file in `.github/`
2. Paste this code into the file: 
   
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