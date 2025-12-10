# Document Manager Documentation Site

This is the Nextra-powered documentation site for Document Manager. It provides a beautiful, searchable, and user-friendly interface for the documentation.

## 🎯 Key Features

- ✅ **No duplicate content** - Uses symlinks to reference existing markdown files in `dm-ui/docs/user`
- ✅ **Multi-language support** - English and French documentation
- ✅ **Beautiful UI** - Modern, responsive design with dark mode
- ✅ **Full-text search** - Quick search across all documentation
- ✅ **Static export** - Can be deployed anywhere as static HTML

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

**Important:** You don't edit files in `docs-site/pages/en` or `docs-site/pages/fr` directly!

Instead, edit the original markdown files in:
- `dm-ui/docs/user/en/` for English
- `dm-ui/docs/user/fr/` for French

The docs-site will automatically reflect your changes because it uses symlinks.

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

### Quick Deploy to GitHub Pages

1. **Create GitHub repository**:
   ```bash
   cd docs-site
   git init
   git add .
   git commit -m "Initial commit: Nextra documentation site"
   git remote add origin https://github.com/SwiftBinder/docs-site.git
   git branch -M main
   git push -u origin main
   ```

2. **Enable GitHub Pages**:
   - Go to repository Settings > Pages
   - Under Source, select "GitHub Actions"

3. **Automatic deployment**:
   - The included GitHub Actions workflow deploys automatically on push to main
   - Your docs will be live at: `https://swiftbinder.github.io/docs-site/`

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete deployment guide including:
- GitHub Pages setup
- Vercel deployment
- Netlify deployment
- Custom domains
- Manual deployment options

### Other Deployment Options

Deploy the `out/` directory to any static hosting:
- Vercel (connect GitHub repo for auto-deploys)
- Netlify (drag & drop `out/` folder)
- AWS S3 + CloudFront
- Azure Static Web Apps
- Any web server (Apache, Nginx)

## 🔧 Configuration

### Change Port

Edit `package.json` scripts to use a different port:

```json
"dev": "next dev -p 3001",
"start": "next start -p 3001"
```

### Update Base Path

If deploying to a subdirectory, edit `next.config.mjs`:

```javascript
export default withNextra({
  basePath: '/docs',
  // ...
})
```

## 📚 Learn More

- [Nextra Documentation](https://nextra.site)
- [Next.js Documentation](https://nextjs.org/docs)

## 🐛 Troubleshooting

### Symlinks not working on Windows?

On Windows, you may need to:
1. Run as Administrator
2. Or copy directories instead of symlinking:

```bash
cp -r ../dm-ui/docs/user/en pages/en
cp -r ../dm-ui/docs/user/fr pages/fr
```

### Build errors?

Make sure all dependencies are installed:

```bash
rm -rf node_modules package-lock.json
npm install
```

### Changes not showing?

1. Restart the dev server
2. Clear Next.js cache: `rm -rf .next`
3. Check that symlinks are working: `ls -la pages/`

## ✨ Benefits

- **Maintainability** - Edit docs once, they appear in both the app and docs site
- **SEO** - Static HTML is great for search engines
- **Performance** - Fast, optimized static site
- **Developer Experience** - Hot reload, TypeScript support
- **User Experience** - Beautiful UI with search, dark mode, responsive design
