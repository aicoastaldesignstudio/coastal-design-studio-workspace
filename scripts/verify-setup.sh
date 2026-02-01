#!/bin/bash
# Verify Coastal Design Studio Claude Code setup

echo "🔍 Verifying Coastal Design Studio setup..."
echo ""

ERRORS=0

# Check directory structure
echo "Checking directory structure..."
for dir in ".claude" ".claude/agents" ".claude/commands" ".claude/templates" "scripts"; do
    if [ -d "$dir" ]; then
        echo "  ✅ $dir/"
    else
        echo "  ❌ $dir/ missing"
        ((ERRORS++))
    fi
done

echo ""
echo "Checking agent files..."
for agent in "brand-refiner" "seo-optimizer" "newsletter-writer" "competitive-intel" "design-inspiration"; do
    if [ -f ".claude/agents/$agent.md" ]; then
        echo "  ✅ $agent.md"
    else
        echo "  ❌ $agent.md missing"
        ((ERRORS++))
    fi
done

echo ""
echo "Checking command files..."
for cmd in "maintenance" "client-pipeline" "newsletter"; do
    if [ -f ".claude/commands/$cmd.sh" ]; then
        if [ -x ".claude/commands/$cmd.sh" ]; then
            echo "  ✅ $cmd.sh (executable)"
        else
            echo "  ⚠️  $cmd.sh (not executable - run chmod +x)"
        fi
    else
        echo "  ❌ $cmd.sh missing"
        ((ERRORS++))
    fi
done

echo ""
echo "Checking core files..."
for file in "CLAUDE.md" "README.md" ".gitignore" ".claude/templates/mcp.template.json"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file missing"
        ((ERRORS++))
    fi
done

echo ""
echo "Checking MCP config..."
if [ -f ~/.claude/mcp.json ]; then
    if grep -q "PLACEHOLDER" ~/.claude/mcp.json; then
        echo "  ⚠️  ~/.claude/mcp.json exists but has PLACEHOLDER values"
        echo "     Edit with real credentials before using MCP tools"
    else
        echo "  ✅ ~/.claude/mcp.json configured"
    fi
else
    echo "  ⚠️  ~/.claude/mcp.json not found"
    echo "     Run ./scripts/setup-claude.sh to create from template"
fi

echo ""
if [ $ERRORS -eq 0 ]; then
    echo "✅ All checks passed! Setup is complete."
else
    echo "❌ Found $ERRORS error(s). Review above and fix."
fi
