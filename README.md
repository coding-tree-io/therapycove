# Therapy Cove

> Modern mental health center site for Therapy Cove (Athens). Calm, professional, content‑driven, bilingual.

## ✨ Overview
Therapy Cove is a Jekyll site for a real mental health center in Athens. Content lives in `_data/` and layout sections in `_includes/`. CSS is bundled into a single output for performance.

## 🧰 Tech Stack
- Jekyll + Jekyll Polyglot
- Pico CSS + Tailwind build + custom CSS
- Lightning CSS for bundling (`assets/css/site.bundle.css`)

## 🚀 Quick Start
### Prerequisites
- Ruby 4.0.6 (`.ruby-version`) + Bundler 4.0.21; Windows requires MSYS2 build tools and Ruby on PATH.
- Node.js 24.21.0 LTS (`.node-version`) + npm 12.1.0.

### Install
```bash
gem install bundler -v 4.0.21
bundle install
npm install --global npm@12.1.0
npm ci
```

### Run locally
```bash
pwsh ./scripts/dev.ps1
```
Or:
```bash
bundle exec jekyll serve --config _config.yml,_config.local.yml
```

### Build CSS bundle
```bash
npm run build:css
```
This regenerates Tailwind utilities in `assets/css/tailwind-build.css`, then bundles them with Pico and custom CSS into `assets/css/site.bundle.css`. Commit both outputs. Pico supplies the CSS reset; Tailwind Preflight is intentionally excluded.

## 🧩 Structure
- `_layouts/` layouts
- `_includes/` sections
- `_data/` localized content
- `assets/css/` styles + bundle entry
- `assets/js/` behavior

## 🌍 Localization
- Greek: `_data/gr/cove/`
- English: `_data/en/cove/`

Language toggle: `_config.yml` → `flags.show_lang_toggle`.

Polyglot adds the language prefix. English front matter must use `/` and `/legal/`, matching the Greek page IDs; do not include `/en/` in `permalink`. The Decap legal-page default follows this rule.
Run `bundle exec jekyll clean` once when upgrading an existing checkout to remove stale `/en/en/` output before rebuilding.
The root `sitemap.xml` includes both languages and is excluded from localization to prevent duplicate per-language sitemaps.

## ✅ Git Hooks
Husky installs on `npm ci` or `npm install` and checks both generated CSS files before commits.

## 📦 Deployment
GitHub Pages via `.github/workflows/pages.yml` on `main`. Actions builds Jekyll 4 with explicitly declared plugins; the GitHub Pages gem's Jekyll 3 dependency set is no longer used. CI installs locked npm dependencies and verifies generated CSS before building and checking the site.

## 🛠️ Troubleshooting
- Bundler errors: `bundle install`
- CSS not updating: `npm run build:css` and commit the bundle
- Hooks not firing: `npm install`

## 🔐 CMS (Decap)
Decap CMS 3.16.3 is pinned in `admin/index.html`. The development script starts the locked Decap server 3.11.3 after `npm ci`; it can also be run with `npm run cms`. The local backend permits content writes, so use it only on your development machine. Production authentication remains configured in `admin/config.yml`.

## Dependency updates

See [the dependency update notes](DEPENDENCY_UPDATES.md) for versions retained below their latest releases and the upstream constraints.

Use LTS runtimes where available and stable releases otherwise. Keep Tailwind and its CLI on the same version. Refresh npm and Bundler lockfiles together with runtime constraints, then run `npm run build:css`, both Jekyll configurations, and browser checks for both languages. Do not bypass dependency constraints with forced overrides.

After a local-config Jekyll build, run `npm test`. After a production-config build, run `npm test -- https://www.therapycove.gr`. These checks cover localized routes and content, canonical URLs, structured data, and development-file exclusions. CI runs both configurations on Windows and Linux.

Vendored dependencies and their upstream versions are documented in `assets/vendor/README.md`. Copy upstream distributions and license notices when updating them. The attribution component has no verified upstream release channel and remains at 0.1.0.

As of September 26, 2026, `npm audit` reports two low-severity findings for Decap server and its `@hapi/joi` dependency ([GHSA-6w3j-5fw6-r9vr](https://github.com/advisories/GHSA-6w3j-5fw6-r9vr)). The latest Decap server still requires that deprecated package; no compatible upstream fix is available. It is development-only and excluded from the published site. No forced dependency override is applied.

Ruby 4.0.7 is newer, but both RubyInstaller 4.0.7 and the attempted 3.4.11 fallback fail to start on the local Windows setup with a `ruby_builtin_dlls` side-by-side assembly error. MSYS2's Ruby 4.0.6 starts successfully, so it is the selected runtime. Revisit 4.0.7 when a working Windows distribution is available; this is a local runtime issue, not evidence that Jekyll rejects 4.0.7.

## 📬 Contact Form Delivery
- Delivery target is configured in Form.taxi dashboard.

## ⚖️ Privacy & Legal
- Greek legal notice: `/legal/`
- English legal notice: `/en/legal/`

## 📄 Licensing
- Code license: `LICENSE` (MIT)
- Asset rights and attributions: `ASSET_RIGHTS.md`

### Commit policy (Decap)
- Direct to `main`
- One commit per save
- Content create/update/delete: `docs(content): <action> <locale>/<entry-slug>`
- Media upload/delete: `docs(media): <action> <path>`
- Locale + area derive from Decap collection names: `gr-sections`, `gr-therapists`, `gr-approaches`, `en-sections`, `en-therapists`, `en-approaches`

---

### 📍 Site Identity
- Brand: Therapy Cove
- Location: Athens, Greece
- Tone: calm, supportive, professional
