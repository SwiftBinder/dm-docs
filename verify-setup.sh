#!/bin/bash

echo "🔍 Verifying Nextra Documentation Site Setup..."
echo ""

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Run this from the docs-site directory"
    exit 1
fi

# Check symlinks
echo "📁 Checking symlinks..."
if [ -L "pages/en" ] && [ -e "pages/en" ]; then
    echo "✅ English docs symlink OK"
else
    echo "❌ English docs symlink missing or broken"
fi

if [ -L "pages/fr" ] && [ -e "pages/fr" ]; then
    echo "✅ French docs symlink OK"
else
    echo "❌ French docs symlink missing or broken"
fi

# Check dependencies
echo ""
echo "📦 Checking dependencies..."
if [ -d "node_modules" ]; then
    echo "✅ Dependencies installed"
else
    echo "⚠️  Dependencies not installed. Run: npm install"
fi

# Check config files
echo ""
echo "⚙️  Checking configuration..."
[ -f "next.config.mjs" ] && echo "✅ next.config.mjs" || echo "❌ next.config.mjs missing"
[ -f "theme.config.tsx" ] && echo "✅ theme.config.tsx" || echo "❌ theme.config.tsx missing"
[ -f "tsconfig.json" ] && echo "✅ tsconfig.json" || echo "❌ tsconfig.json missing"

echo ""
echo "✨ Setup verification complete!"
echo ""
echo "To start the dev server:"
echo "  npm run dev"
echo ""
echo "Then open: http://localhost:3001"
