import React from 'react'
import { DocsThemeConfig } from 'nextra-theme-docs'

const config: DocsThemeConfig = {
    logo: <span style={{ fontWeight: 700, fontSize: '1.2rem' }}>📄 Document Manager</span>,
    project: {
        link: 'https://github.com/yourusername/document-manager',
    },
    docsRepositoryBase: 'https://github.com/yourusername/document-manager/tree/main/docs-site',
    footer: {
        text: `© ${new Date().getFullYear()} Document Manager. All rights reserved.`,
    },
    useNextSeoProps() {
        return {
            titleTemplate: '%s – Document Manager'
        }
    },
    head: (
        <>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta property="og:title" content="Document Manager Documentation" />
            <meta property="og:description" content="Complete user guide for Document Manager" />
        </>
    ),
    primaryHue: 212,
    darkMode: true,
    nextThemes: {
        defaultTheme: 'system',
    },
    sidebar: {
        defaultMenuCollapseLevel: 1,
        toggleButton: true,
    },
    toc: {
        backToTop: true,
    },
    editLink: {
        text: 'Edit this page →'
    },
    feedback: {
        content: 'Question? Give us feedback →',
        labels: 'feedback'
    },
    navigation: {
        prev: true,
        next: true
    },
    i18n: [
        { locale: 'en', text: 'English' },
        { locale: 'fr', text: 'Français' }
    ],
}

export default config
