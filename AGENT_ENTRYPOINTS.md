# Agent Entrypoints

This file lists the highest-value files and commands to read first when working on this repo.

## Config
- _config.yml
- _config.local.yml
- Gemfile
- Gemfile.lock
- .ruby-version (Ruby 4.0.6; Windows runtime constraint documented in README)
- .node-version (Node 24.21.0 LTS)
- package.json and package-lock.json (npm 12.1.0)
- DEPENDENCY_UPDATES.md (upstream version constraints and verification notes)

## Layouts
- _layouts/default.html

## Key includes (structure and content)
- _includes/site-nav.html
- _includes/hero.html
- _includes/audiences.html
- _includes/therapists.html
- _includes/approaches.html
- _includes/contact.html
- _includes/footer.html
- _includes/seo.html

## Data (primary content)
- _data/gr/cove/
- _data/en/cove/
- _data/gr/cove/site_nav.yml
- _data/gr/cove/hero.yml
- _data/gr/cove/audiences.yml
- _data/gr/cove/therapists_section.yml
- _data/gr/cove/approaches_section.yml
- _data/gr/cove/therapists/
- _data/gr/cove/approaches/
- _data/gr/cove/contact.yml
- _data/gr/cove/footer.yml

## Styles
- assets/css/base.css
- assets/css/layout.css
- assets/css/modules.css
- assets/css/therapy-cove.css (imports the three files above)
- assets/css/site.css (production bundle entry)
- assets/css/tailwind.css (Tailwind sources; Pico owns the reset)
- assets/vendor/README.md (vendored dependency versions)

## Scripts
- assets/js/approaches-tabs.js

## Build / Dev commands
- PowerShell (Windows): `pwsh ./scripts/dev.ps1`
- Jekyll (manual): `bundle exec jekyll serve --config _config.yml,_config.local.yml`
- Install: `bundle install` and `npm ci`
- CSS bundle: `npm run build:css`; commit both `tailwind-build.css` and `site.bundle.css`
- CMS backend: `npm run cms` (locked local dependency)
- Route checks: `npm test` after a local-config build; `npm test -- https://www.therapycove.gr` after a production build
- Polyglot prefixes English routes automatically; keep front matter and CMS permalinks language-neutral.
- Git hooks (Husky): `npm ci` or `npm install` (runs `prepare`)
- Deployment: Actions builds Jekyll 4 with explicit plugins; do not restore the `github-pages` gem.
