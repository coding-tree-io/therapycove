# AGENTS.md (project: therapycove)

This repo-local file overrides `.codex/AGENTS.md` for Therapy Cove.

## Purpose
Jekyll + Jekyll Polyglot site for the Athens mental health practice. Keep the calm, supportive, bilingual presentation consistent with the current brand.

## Read first
- `AGENT_ENTRYPOINTS.md`
- `README.md`
- `_config.yml`
- `_config.local.yml`
- `Gemfile`
- `_includes/seo.html`
- `_includes/contact.html`
- `assets/css/therapy-cove.css`

## Stack / invariants
- Jekyll + Jekyll Polyglot.
- Content lives in `_data/gr/cove` and `_data/en/cove`.
- Styles are bundled through `assets/css/therapy-cove.css`; `npm run build:css` updates `assets/css/site.bundle.css`.
- GitHub Pages compatible; avoid unsupported plugins.
- Keep copy, section order, and tone aligned with the current Therapy Cove practice model and the three-psychologist setup.
- Conventional Commits and small increments remain the default.
- Decap CMS config should stay flexible for the current local/prod workflow.

## Commands
- `pwsh ./scripts/dev.ps1`
- `bundle exec jekyll serve --config _config.yml,_config.local.yml`
- `npm run build:css`
- `npm install` (installs hooks / prepare)

## Verification
- If styles changed, run `npm run build:css` and commit the bundle.
- If layout or content changed, verify the relevant pages in the Jekyll server.
- If CMS or config changed, keep `README.md` and `AGENT_ENTRYPOINTS.md` in sync with the current workflow.
