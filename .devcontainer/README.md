# DevContainer for Lami Development

This directory contains the DevContainer configuration for the Lami project, enabling a consistent development environment for both human developers and AI agents.

## What's Included

### Development Environment
- **Node.js 20.x** - For running AI CLI tools (Gemini CLI, Claude Code CLI)
- **Zig 0.13.0** - Latest stable Zig compiler for building the project
- **ZLS (Zig Language Server)** - Intelligent code completion and analysis
- **Git & GitHub CLI** - Version control and GitHub integration

### VS Code Extensions
- **ziglang.vscode-zig** - Zig language support
- **GitHub.copilot** - AI-powered code completion
- **GitHub.copilot-chat** - AI chat integration
- **ms-vscode.vscode-json** - JSON language support
- **redhat.vscode-yaml** - YAML language support
- **ms-vscode.hexeditor** - Binary file editing
- **ms-vscode.cmake-tools** - Build system support
- **vadimcn.vscode-lldb** - Debugging support

### AI Development Tools
- **@google/generative-ai** - Google Gemini API SDK
- **@anthropic-ai/sdk** - Anthropic Claude API SDK

## Getting Started

### Prerequisites
- [VS Code](https://code.visualstudio.com/)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker](https://www.docker.com/)

### Using the DevContainer

1. **Open in VS Code**: Open the project folder in VS Code
2. **Reopen in Container**: When prompted, click "Reopen in Container" or run the command "Remote-Containers: Reopen in Container"
3. **Wait for Setup**: The container will build and install all dependencies automatically
4. **Start Developing**: Once setup is complete, you'll have a fully configured development environment

### Manual Setup (Alternative)
If you prefer to set up the container manually:

```bash
# Open Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
# Run: Remote-Containers: Rebuild Container
```

## Project Commands

Once the DevContainer is running, you can use these commands:

```bash
# Build the project
zig build

# Run the project
zig build run

# Run tests
zig build test

# Check Zig version
zig version

# Check ZLS version
zls --version
```

## AI Agent Integration

This DevContainer is optimized for AI-assisted development:

- **GitHub Copilot** provides real-time code suggestions
- **Copilot Chat** enables conversational programming help
- **Node.js environment** supports running AI CLI tools
- **Consistent environment** ensures AI agents can work effectively

## Troubleshooting

### Container Build Issues
If the container fails to build:
1. Ensure Docker is running
2. Try rebuilding: Command Palette → "Remote-Containers: Rebuild Container"
3. Check Docker logs for specific error messages

### Zig Installation Issues
If Zig commands don't work:
1. Verify installation: `zig version`
2. Check PATH: `echo $PATH`
3. Rebuild container if needed

### Extension Issues
If VS Code extensions aren't working:
1. Reload VS Code window: Command Palette → "Developer: Reload Window"
2. Check extension installation in Extensions view
3. Rebuild container if extensions are missing

## Customization

You can customize the DevContainer by modifying:

- **`.devcontainer/devcontainer.json`** - Main configuration
- **`.devcontainer/setup.sh`** - Installation script
- **Extensions list** in devcontainer.json
- **VS Code settings** in devcontainer.json

## Performance Optimization

The DevContainer includes performance optimizations:

- **Bind mounts** for `.zig-cache` and `zig-out` directories
- **File exclusions** to hide build artifacts from VS Code
- **Cached consistency** for faster file operations

## Contributing

When modifying the DevContainer configuration:

1. Test changes in a clean container rebuild
2. Update this README if adding new tools or features
3. Ensure compatibility with both local development and CI/CD
4. Document any new environment variables or settings