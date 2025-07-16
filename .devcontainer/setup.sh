#!/bin/bash
set -e

echo "Setting up lami development environment..."

# Install required build dependencies
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 python3-pip clang llvm

# Install Gemini CLI
echo "Installing Gemini CLI..."
npm install -g @google/gemini-cli

# Initialize zig-bootstrap submodule if not already done
echo "Setting up zig-bootstrap..."
cd /workspace
if [ ! -d "zig-bootstrap/.git" ]; then
    echo "Initializing zig-bootstrap submodule..."
    # First try to initialize existing submodule
    if git submodule status zig-bootstrap >/dev/null 2>&1; then
        git submodule update --init --recursive zig-bootstrap
    else
        # If submodule doesn't exist, add it
        git submodule add https://github.com/ziglang/zig-bootstrap.git zig-bootstrap
        git submodule update --init --recursive zig-bootstrap
    fi
else
    echo "zig-bootstrap already initialized, updating..."
    cd zig-bootstrap
    git fetch origin
    git checkout master
    git pull origin master
    git submodule update --init --recursive
    cd ..
fi

# Build Zig from master
echo "Building Zig from master branch..."
cd /workspace/zig-bootstrap
git checkout master
./build -j$(nproc)

# Verify the build was successful
if [ -f "out/bin/zig" ]; then
    echo "Zig compiler built successfully!"
    echo "Version: $(./out/bin/zig version)"
else
    echo "Error: Zig compiler build failed!"
    exit 1
fi

# Make zig-update script executable
chmod +x /workspace/zig-update

echo "Setup complete! Zig compiler is available at /workspace/zig-bootstrap/out/bin/zig"
echo "Run 'zig version' to verify the installation."