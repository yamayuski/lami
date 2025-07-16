#!/bin/bash
set -e

echo "Testing DevContainer setup..."

# Test 1: Check if Node.js is available
echo "Testing Node.js installation..."
node --version
npm --version

# Test 2: Check if Gemini CLI is installed
echo "Testing Gemini CLI..."
if command -v gemini &> /dev/null; then
    echo "✓ Gemini CLI is installed"
else
    echo "✗ Gemini CLI not found"
    exit 1
fi

# Test 3: Check if Zig is available
echo "Testing Zig installation..."
if command -v zig &> /dev/null; then
    echo "✓ Zig is installed"
    zig version
else
    echo "✗ Zig not found in PATH"
    exit 1
fi

# Test 4: Test zig init functionality
echo "Testing zig init..."
mkdir -p /tmp/test-zig-project
cd /tmp/test-zig-project
zig init
if [ -f "build.zig" ] && [ -f "src/main.zig" ]; then
    echo "✓ zig init successful"
    # Test that the project builds
    zig build
    echo "✓ zig build successful"
else
    echo "✗ zig init failed"
    exit 1
fi

# Test 5: Test zig-update script
echo "Testing zig-update script..."
cd /workspace
if [ -x "./zig-update" ]; then
    echo "✓ zig-update script is executable"
else
    echo "✗ zig-update script not found or not executable"
    exit 1
fi

echo "All tests passed! DevContainer setup is working correctly."