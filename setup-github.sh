#!/bin/bash

# Quick setup script for deploying docs-site to GitHub

echo "🚀 Document Manager Docs - GitHub Deployment Setup"
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo ""
fi

# Check if remote exists
if ! git remote get-url origin &>/dev/null; then
    echo "❓ Enter your GitHub repository URL (e.g., https://github.com/SwiftBinder/docs-site.git):"
    read -r repo_url
    
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ Remote added: $repo_url"
    else
        echo "⚠️  No remote URL provided. You can add it later with:"
        echo "   git remote add origin <your-repo-url>"
    fi
    echo ""
fi

# Add files
echo "📝 Adding files to git..."
git add .
echo ""

# Commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: Nextra documentation site" || echo "⚠️  No changes to commit or already committed"
echo ""

# Set main branch
echo "🌿 Setting main branch..."
git branch -M main
echo ""

# Instructions
echo "✨ Setup complete!"
echo ""
echo "📋 Next steps:"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   https://github.com/new"
echo "   Name: docs-site"
echo ""
echo "2. Push to GitHub:"
if git remote get-url origin &>/dev/null; then
    echo "   git push -u origin main"
else
    echo "   git remote add origin <your-repo-url>"
    echo "   git push -u origin main"
fi
echo ""
echo "3. Enable GitHub Pages:"
echo "   - Go to Settings > Pages"
echo "   - Source: GitHub Actions"
echo ""
echo "4. Your docs will be live at:"
echo "   https://<your-username>.github.io/docs-site/"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md"
