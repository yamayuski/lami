#!/bin/bash

# DevContainer setup script for Lami development environment
# Installs Zig and ZLS (Zig Language Server)

set -e

echo "🚀 Setting up Lami development environment..."

# Install Zig
echo "📦 Installing Zig..."
ZIG_VERSION="0.13.0"
ZIG_URL="https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz"

# Download and install Zig
curl -L "$ZIG_URL" | sudo tar -xJ -C /usr/local/
sudo mv "/usr/local/zig-linux-x86_64-${ZIG_VERSION}" /usr/local/zig
sudo ln -sf /usr/local/zig/zig /usr/local/bin/zig

# Install ZLS (Zig Language Server)
echo "🔧 Installing ZLS (Zig Language Server)..."
ZLS_VERSION="0.13.0"
ZLS_URL="https://github.com/zigtools/zls/releases/download/${ZLS_VERSION}/zls-x86_64-linux.tar.xz"

# Download and install ZLS
curl -L "$ZLS_URL" | sudo tar -xJ -C /usr/local/bin/
sudo chmod +x /usr/local/bin/zls

# Verify installations
echo "✅ Verifying installations..."
zig version
zls --version

# Install additional Node.js packages for AI CLI tools
echo "📦 Installing Node.js packages for AI development..."
npm install -g @google/generative-ai @anthropic-ai/sdk

# Create sample Zig project structure if it doesn't exist
if [ ! -f "build.zig" ]; then
    echo "📁 Creating sample Zig project structure..."
    cat > build.zig << 'EOF'
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "lami",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}
EOF

    mkdir -p src
    cat > src/main.zig << 'EOF'
const std = @import("std");

pub fn main() !void {
    std.debug.print("Hello, Lami CLI!\n", .{});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit();
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
EOF
fi

echo "🎉 Development environment setup complete!"
echo "   - Zig ${ZIG_VERSION} installed"
echo "   - ZLS (Zig Language Server) installed"  
echo "   - Node.js packages for AI development installed"
echo "   - VS Code extensions will be automatically installed"
echo ""
echo "You can now:"
echo "   - Run 'zig build' to build the project"
echo "   - Run 'zig build run' to run the project"
echo "   - Run 'zig build test' to run tests"
echo "   - Use GitHub Copilot for AI-assisted development"