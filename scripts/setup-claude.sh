#!/bin/bash
set -e

echo "🏖️ Setting up Claude Code for Coastal Design Studio..."
echo ""

# Check Claude Code installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code not installed"
    echo "Install: brew install claude"
    exit 1
fi

# Check we're in COASTALDESIGNSTUDIO directory
if [[ ! "$PWD" =~ "COASTALDESIGNSTUDIO" ]]; then
    echo "⚠️  Warning: Not in COASTALDESIGNSTUDIO directory"
    echo "Current: $PWD"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create Claude config directory
mkdir -p ~/.claude

# Copy MCP template
if [ ! -f ~/.claude/mcp.json ]; then
    echo "📝 Creating MCP config from Coastal Design Studio template..."
    cp .claude/templates/mcp.template.json ~/.claude/mcp.json
    echo ""
    echo "⚠️  IMPORTANT: Edit ~/.claude/mcp.json"
    echo "   Replace PLACEHOLDER values with team credentials"
    echo "   Get credentials from team lead or 1Password vault"
    echo ""
else
    echo "✅ MCP config already exists at ~/.claude/mcp.json"
    echo "⚠️  Make sure it has Coastal Design Studio credentials"
fi

# Make commands executable
echo "🔧 Making custom commands executable..."
chmod +x .claude/commands/*.sh

# Verify structure
echo ""
echo "🔍 Verifying team setup..."
if [ -d .claude/agents ] && [ -f CLAUDE.md ]; then
    echo "✅ Team setup verified"
else
    echo "❌ Missing files - check .claude/agents/ and CLAUDE.md"
    exit 1
fi

echo ""
echo "✅ Coastal Design Studio Claude Code setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Edit ~/.claude/mcp.json with team credentials"
echo "2. Get access to team 1Password vault"
echo "3. Run: claude"
echo "4. Test: @brand-refiner or /help"
echo "5. Reference: @CLAUDE.md for team standards"
echo ""
echo "🏖️ Welcome to the team!"
