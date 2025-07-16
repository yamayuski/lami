# GitHub Copilot Instructions for lami

## Project Overview
lami is a next-generation Git CLI tool built with Zig. This repository contains the core implementation of lami, which aims to improve upon the traditional Git experience.

## Development Environment

### Language and Version
- **Language**: Zig
- **Version**: 0.14.1
- Use Zig 0.14.1 syntax and features when writing code
- Follow Zig naming conventions and coding style

### Target Platform
- **Primary target**: linux/amd64
- Additional platform builds will be added in the future
- Focus on linux/amd64 compatibility when making changes
- Consider cross-platform compatibility for future expansion

## Development Guidelines

### Code Style
- Follow standard Zig formatting conventions
- Use `zig fmt` to format code
- Write clear, self-documenting code
- Add comments for complex logic

### Building and Testing
- Use `zig build` for building the project
- Use `zig test` for running tests
- Ensure all changes work on linux/amd64
- Test build artifacts in `zig-out/` directory

### Git Integration
- Since this is a Git-related tool, be mindful of Git workflows
- Test interactions with actual Git repositories
- Consider edge cases in Git operations

### File Organization
- Build artifacts go in `zig-out/` (gitignored)
- Cache files go in `.zig-cache/` (gitignored)
- Keep source code organized and modular

## When Assisting
- Prioritize Zig 0.14.1 compatibility
- Focus on linux/amd64 platform first
- Consider Git workflow implications
- Suggest appropriate Zig standard library usage
- Help with error handling using Zig's error system
- Assist with memory management using Zig's allocators