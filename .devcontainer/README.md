# DevContainer Setup for lami

This DevContainer provides a complete development environment for the lami project with:

- **Node.js LTS (22)** - For running Gemini CLI tools
- **Zig Compiler** - Built from zig-bootstrap master branch for latest features
- **VS Code Extensions** - GitHub Copilot and Zig Language Server
- **Development Tools** - Git, GitHub CLI, and build dependencies

## Quick Start

1. Open this repository in VS Code
2. When prompted, click "Reopen in Container"
3. Wait for the initial setup to complete (this may take 15-30 minutes for the first build)
4. Run `zig version` to verify Zig installation
5. Run `zig init` to create initial Zig project files

## Updating Zig

To update to the latest Zig master branch:

```bash
./zig-update
```

This will pull the latest zig-bootstrap changes and rebuild the compiler.

## Installed Tools

- **Zig**: Latest master build from zig-bootstrap
- **Node.js**: LTS version 22
- **Gemini CLI**: Installed globally via npm
- **Build tools**: GCC, Clang, CMake, Python3

## VS Code Extensions

The following extensions are automatically installed:

- GitHub Copilot & Copilot Chat
- Zig Language Server (ziglang.vscode-zig)
- JSON support

The Zig extension is pre-configured to use the locally built Zig compiler.