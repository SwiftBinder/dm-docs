# Documentation Deployment Guide

This guide explains how to deploy the Document Manager documentation site to various platforms.

## Prerequisites

- GitHub repository created for `docs-site`
- Documentation source files in `dm-ui` repository

## GitHub Pages Deployment (Recommended)

### 1. Create GitHub Repository

```bash
cd docs-site
git init
git add .
git commit -m "Initial commit: Nextra documentation site"
git remote add origin https://github.com/SwiftBinder/docs-site.git
git branch -M main
git push -u origin main
```

### 2. Enable GitHub Pages

1. Go to your repository on GitHub: `https://github.com/SwiftBinder/docs-site`
2. Navigate to **Settings** > **Pages**
3. Under **Source**, select **GitHub Actions**

### 3. Push and Deploy

The GitHub Actions workflow (`.github/workflows/deploy.yml`) will automatically:
- Check out both `docs-site` and `dm-ui` repositories
- Convert markdown files to MDX format
- Build the static site
- Deploy to GitHub Pages

Your site will be available at: `https://swiftbinder.github.io/docs-site/`

### 4. Custom Domain (Optional)

To use a custom domain:
1. Add a `CNAME` file to the `public/` directory with your domain
2. Configure DNS settings with your domain provider
3. Enable HTTPS in GitHub Pages settings

## Vercel Deployment (Alternative)

### 1. Install Vercel CLI

```bash
npm install -g vercel
```

### 2. Deploy

```bash
cd docs-site
./convert-docs.sh  # Convert markdown to MDX
vercel --prod
```

### 3. Configure Vercel Project

- Set **Framework Preset**: Next.js
- Set **Build Command**: `./convert-docs.sh && npm run build`
- Set **Output Directory**: `out`

## Netlify Deployment (Alternative)

### 1. Create `netlify.toml`

```toml
[build]
  command = "./convert-docs.sh && npm run build"
  publish = "out"

[[plugins]]
  package = "@netlify/plugin-nextjs"
```

### 2. Deploy

```bash
npm install -g netlify-cli
netlify deploy --prod
```

## Manual Build and Deploy

### 1. Build Locally

```bash
cd docs-site
./convert-docs.sh
npm run build
```

This creates a static site in the `out/` directory.

### 2. Deploy to Any Static Host

Upload the `out/` directory to:
- AWS S3 + CloudFront
- Azure Static Web Apps
- Google Cloud Storage
- Any web server (Apache, Nginx, etc.)

## Updating Documentation

### Workflow

1. Edit markdown files in `dm-ui/docs/user/en/` or `dm-ui/docs/user/fr/`
2. Commit and push changes to `dm-ui` repository
3. The GitHub Actions workflow automatically rebuilds and deploys

### Manual Update

If using manual deployment:

```bash
cd docs-site
./convert-docs.sh  # Pull latest changes from dm-ui
npm run build
# Deploy the out/ directory
```

## Troubleshooting

### Build Fails

- Ensure `convert-docs.sh` runs successfully
- Check that all markdown files have valid MDX syntax
- Verify all `_meta.json` files are present

### 404 Errors

- Ensure `trailingSlash: true` is set in `next.config.mjs`
- Check `basePath` configuration if deploying to a subdirectory

### Images Not Loading

- Place images in `public/` directory
- Reference them as `/image.png` (absolute paths)
- Ensure `images: { unoptimized: true }` is set in `next.config.mjs`

## Monitoring

- **GitHub Pages**: Check Actions tab for deployment status
- **Vercel**: View deployment logs in Vercel dashboard
- **Netlify**: Check deploy log in Netlify dashboard

## CI/CD Notes

The GitHub Actions workflow:
- Triggers on push to `main` branch
- Can be manually triggered via workflow_dispatch
- Requires access to both `docs-site` and `dm-ui` repositories
- Converts markdown to MDX before building
- Deploys to GitHub Pages automatically

## Security

- Documentation is public by default
- For private documentation, use:
  - GitHub Pages with private repository (requires GitHub Pro)
  - Vercel with password protection
  - Self-hosted solution with authentication

## Cost

- **GitHub Pages**: Free (100GB bandwidth/month)
- **Vercel**: Free tier available (100GB bandwidth)
- **Netlify**: Free tier available (100GB bandwidth)

Choose GitHub Pages for simplicity and no cost!
