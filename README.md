# Document Manager Documentation Site

This is the Nextra-powered documentation site for Document Manager. It provides a beautiful, searchable, and user-friendly interface for the documentation.

**🌐 Live Site**: https://swiftbinder.github.io/dm-docs/

## 🎯 Key Features

- ✅ **Multi-language support** - English and French documentation
- ✅ **Beautiful UI** - Modern, responsive design with dark mode
- ✅ **Full-text search** - Quick search across all documentation
- ✅ **Static export** - Deployed on GitHub Pages
- ✅ **Auto-deployment** - Automatically rebuilds on push to main

## 📁 Structure

```
docs-site/
├── pages/
│   ├── index.mdx          # Home page
│   ├── en/                # Symlink → ../dm-ui/docs/user/en
│   ├── fr/                # Symlink → ../dm-ui/docs/user/fr
│   └── _meta.json         # Navigation configuration
├── theme.config.tsx       # Nextra theme configuration
├── next.config.mjs        # Next.js + Nextra config
└── package.json
```

## 🚀 Getting Started

### 1. Install Dependencies

```bash
cd docs-site
npm install
```

### 2. Run Development Server

```bash
npm run dev
```

The site will be available at http://localhost:3001

### 3. Build for Production

```bash
npm run build
```

### 4. Export Static HTML

```bash
npm run export
```

This creates a static site in the `out/` directory that can be deployed anywhere.

## 📝 Editing Documentation

### Update Documentation Content

1. **Edit markdown files** in `dm-ui/docs/user/en/` (for English) or `dm-ui/docs/user/fr/` (for French)

2. **Convert to MDX format**:
   ```bash
   cd docs-site
   ./convert-docs.sh
   ```

3. **Commit and push changes**:
   ```bash
   git add pages/
   git commit -m "docs: update documentation content"
   git push
   ```

4. **Wait for deployment**:
   - Check workflow status: https://github.com/SwiftBinder/dm-docs/actions
   - Usually takes 1-2 minutes to complete
   - Your changes will be live at: https://swiftbinder.github.io/dm-docs/

### Local Preview

To preview changes locally before deploying:

```bash
npm run dev
```

Visit http://localhost:3001 to see your changes.

## 🎨 Customization

### Update Branding

Edit `theme.config.tsx` to change:
- Logo
- Colors
- Footer text
- Social links
- SEO metadata

### Add Navigation Items

Edit the `_meta.json` files in each directory to control:
- Menu order
- Section titles
- Icons (using emoji)

## 🌐 Deployment

### Current Deployment

This site is deployed to **GitHub Pages** at:
- **Production URL**: https://swiftbinder.github.io/dm-docs/
- **Repository**: https://github.com/SwiftBinder/dm-docs

### How It Works

1. **Push to main branch** triggers automatic deployment
2. **GitHub Actions workflow** builds the site
3. **Deploys to GitHub Pages** in 1-2 minutes
4. **Live site updates** automatically

### Checking Deployment Status

1. **View workflow runs**: https://github.com/SwiftBinder/dm-docs/actions
2. **Check for errors** in the workflow log
3. **Verify deployment** at https://swiftbinder.github.io/dm-docs/

### Test Your Deployment

After deployment completes, verify these URLs work:
- **Home**: https://swiftbinder.github.io/dm-docs/
- **English docs**: https://swiftbinder.github.io/dm-docs/en
- **Business guide**: https://swiftbinder.github.io/dm-docs/en/business/overview
- **Quick start**: https://swiftbinder.github.io/dm-docs/en/quick-start

### Initial Setup (Already Done)

If setting up a new repository:

```bash
cd docs-site
./setup-github.sh
```

Then enable GitHub Pages:
1. Go to repository Settings > Pages
2. Under Source, select "GitHub Actions"

See [DEPLOYMENT.md](DEPLOYMENT.md) for alternative deployment options (Vercel, Netlify, etc.)

## 🔧 Configuration

### Repository-Specific Settings

This project is configured for the `dm-docs` repository with:
- **Base path**: `/dm-docs` (set in `next.config.mjs`)
- **Live URL**: https://swiftbinder.github.io/dm-docs/

If you deploy to a different repository name, update `basePath` in `next.config.mjs`:

```javascript
export default withNextra({
  basePath: '/your-repo-name',
  // ...
})
```

### Development Settings

Change the development port in `package.json`:

```json
"dev": "next dev -p 3001",
"start": "next start -p 3001"
```

## 📚 Learn More

- [Nextra Documentation](https://nextra.site)
- [Next.js Documentation](https://nextjs.org/docs)

## 🐛 Troubleshooting

### Site Has No Styles or 404 Errors

If the deployed site has missing styles or 404 errors:

1. **Check basePath** in `next.config.mjs`:
   - Should match your repository name: `basePath: '/dm-docs'`
   - Update if you renamed the repository

2. **Verify GitHub Pages source**:
   - Go to Settings > Pages
   - Source must be "GitHub Actions" (not "Deploy from a branch")

3. **Check workflow status**:
   - Visit https://github.com/SwiftBinder/dm-docs/actions
   - Look for any failed builds

### Content Not Updating

After editing documentation:

1. **Run conversion script**: `./convert-docs.sh`
2. **Commit MDX files**: `git add pages/ && git commit -m "docs: update"`
3. **Push changes**: `git push`
4. **Wait 1-2 minutes** for GitHub Actions to deploy
5. **Clear browser cache** (Ctrl+Shift+R or Cmd+Shift+R)

### Build Errors

If GitHub Actions workflow fails:

```bash
# Test build locally
npm run build

# If successful locally, check:
# - All files are committed
# - package.json and package-lock.json are in sync
```

### Local Development Issues

```bash
# Clean rebuild
rm -rf node_modules .next out
npm install
npm run dev
```

## ✨ Benefits

- **Easy Maintenance** - Edit markdown once in dm-ui, convert to MDX, deploy
- **Professional Documentation** - Beautiful UI that users love
- **SEO Friendly** - Static HTML is great for search engines
- **Fast Performance** - Optimized static site with instant navigation
- **Zero Cost** - Hosted for free on GitHub Pages
- **Auto Updates** - Push changes and docs update automatically

- **Maintainability** - Edit docs once, they appear in both the app and docs site
- **SEO** - Static HTML is great for search engines
- **Performance** - Fast, optimized static site
- **Developer Experience** - Hot reload, TypeScript support
- **User Experience** - Beautiful UI with search, dark mode, responsive design
