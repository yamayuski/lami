# DevContainer Development Setup

This document explains how to use the DevContainer setup for developing lami.

## Prerequisites

- VS Code with the Dev Containers extension
- Docker Desktop or Docker CE
- Git

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yamayuski/lami.git
   cd lami
   ```

2. **Open in VS Code:**
   ```bash
   code .
   ```

3. **Reopen in Container:**
   - When prompted, click "Reopen in Container"
   - Or use Command Palette: `Dev Containers: Reopen in Container`

4. **Wait for initial setup (15-30 minutes):**
   - Node.js 22 LTS installation
   - Build dependencies installation
   - zig-bootstrap submodule initialization
   - Zig compiler compilation from master branch
   - Gemini CLI installation

## Verifying the Setup

After the DevContainer is built, verify everything works:

1. **Check Node.js:**
   ```bash
   node --version  # Should show v22.x.x
   npm --version   # Should show 10.x.x
   ```

2. **Check Gemini CLI:**
   ```bash
   which gemini    # Should show path to gemini executable
   ```

3. **Check Zig:**
   ```bash
   zig version     # Should show latest master build
   which zig       # Should show /workspace/zig-bootstrap/out/bin/zig
   ```

4. **Test zig init:**
   ```bash
   mkdir test-project
   cd test-project
   zig init
   zig build
   ```

## Using zig-update

To update Zig to the latest master branch:

```bash
./zig-update
```

This script will:
- Fetch latest zig-bootstrap changes
- Switch to master branch
- Update submodules
- Rebuild Zig compiler
- Show new version

## Project Structure

```
lami/
├── .devcontainer/
│   ├── devcontainer.json    # Main DevContainer configuration
│   ├── setup.sh            # Initial setup script
│   ├── test.sh             # Validation test script
│   └── README.md           # DevContainer documentation
├── zig-bootstrap/           # Git submodule (auto-created)
│   └── out/bin/zig         # Compiled Zig binary
├── zig-update              # Script to update Zig compiler
└── .gitmodules             # Git submodule configuration
```

## Development Workflow

1. **Start development:**
   - Open VS Code in the DevContainer
   - Extensions are pre-configured (Copilot, Zig Language Server)

2. **Initialize lami project:**
   ```bash
   zig init  # Creates initial Zig project structure
   ```

3. **Build and test:**
   ```bash
   zig build
   zig test
   ```

4. **Update Zig when needed:**
   ```bash
   ./zig-update
   ```

## Troubleshooting

### Zig not found in PATH
If `zig` command is not found, check:
```bash
ls -la /workspace/zig-bootstrap/out/bin/zig
echo $PATH | grep zig-bootstrap
```

### DevContainer rebuild
If something goes wrong, rebuild the container:
- Command Palette: `Dev Containers: Rebuild Container`

### zig-bootstrap build failed
Check build logs and ensure you have enough disk space (>10GB recommended for the build).

## VS Code Extensions Included

- **GitHub Copilot & Copilot Chat** - AI-powered coding assistance
- **Zig Language Server** - Zig language support, debugging, and IntelliSense
- **JSON** - Enhanced JSON editing support

The Zig extension is pre-configured to use the locally built Zig compiler at `/workspace/zig-bootstrap/out/bin/zig`.