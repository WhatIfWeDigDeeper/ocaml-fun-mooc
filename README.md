## OCaml

ML = Meta Language
CAM = Categorial Abstract Machine

Zinc Abstract Machine

- portable - bytecode interpreter

## Installation

```bash
brew install ocaml
brew install opam

# npm fails so use yarn
yarn global add bs-platform
# or local
yarn add --dev bs-platform

yarn build
yarn upgrade

```

### VS Code Plugins

[ReasonML](https://marketplace.visualstudio.com/items?itemName=jaredly.reason-vscode)

[OCaml Debugger](https://marketplace.visualstudio.com/items?itemName=hackwaly.ocaml-debugger#overview)

### Resources

[ocaml.org](https://ocaml.org/learn/)

# Basic Reason Template

Hello! This project allows you to quickly get started with Reason and BuckleScript. If you wanted a more sophisticated version, try the `react` template (`bsb -theme react -init .`).

# Build

```bash
npm run build
```

# Build + Watch

```
npm run start
```

# Editor

If you use `vscode`, Press `Windows + Shift + B` it will build automatically
