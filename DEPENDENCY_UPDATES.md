# Dependency update notes

Checked September 26, 2026. Direct packages use current stable releases except the documented Ruby runtime constraint. Lockfiles retain upstream dependency requirements; no forced overrides are used.

## Runtime and vendored exceptions

- Ruby 4.0.6 is the newest MSYS2 build available for local verification. RubyInstaller 4.0.7 and 3.4.11 fail before executing code on this Windows setup (`ruby_builtin_dlls` side-by-side assembly error). This does not establish an incompatibility between Jekyll and Ruby 4.0.7.
- Coding Tree attribution remains at 0.1.0 because no authoritative upstream release channel was found.
- Pico 2.1.1, Scrollama 3.2.0, and Husky 9.1.7 were already current. Vendored sources and licenses are listed in `assets/vendor/README.md`.

## npm constraints

Every row below has a newer release outside at least one upstream dependency constraint. Versions are from `npm outdated --all` after `npm update` and a clean `npm ci`.

| Package | Locked | Latest | Upstream requirement |
| --- | --- | --- | --- |
| @colors/colors | 1.6.0 | 1.6.1 | logform: `1.6.0` |
| @hapi/address | 4.1.0 | 5.1.1 | @hapi/joi: `^4.0.1` |
| @hapi/formula | 2.0.0 | 4.0.0 | @hapi/joi: `^2.0.0` |
| @hapi/hoek | 9.3.0 | 11.0.7 | @hapi/address: `^9.0.0`; @hapi/joi: `^9.0.0`; @hapi/topo: `^9.0.0` |
| @hapi/pinpoint | 2.0.1 | 3.0.0 | @hapi/joi: `^2.0.0` |
| @hapi/topo | 5.1.0 | 6.0.2 | @hapi/joi: `^5.0.0` |
| @parcel/watcher | 2.5.1 | 2.6.0 | @tailwindcss/cli: `2.5.1` |
| @rollup/plugin-node-resolve | 15.3.1 | 16.0.3 | flowbite-datepicker: `^15.2.3` |
| @simple-git/argv-parser | 1.1.1 | 2.0.0 | simple-git: `^1.1.0` |
| @types/resolve | 1.20.2 | 1.20.6 | @rollup/plugin-node-resolve: `1.20.2` |
| array-flatten | 1.1.1 | 3.0.0 | express: `1.1.1` |
| async-mutex | 0.3.2 | 0.5.0 | decap-server: `^0.3.0` |
| basic-auth | 2.0.1 | 3.0.0 | morgan: `~2.0.1` |
| body-parser | 1.20.8 | 2.3.0 | express: `~1.20.5` |
| content-disposition | 0.5.4 | 3.0.0 | express: `~0.5.4` |
| content-type | 1.0.5 | 3.1.1 | body-parser: `~1.0.5`; express: `~1.0.4` |
| cookie | 0.7.2 | 2.0.1 | express: `~0.7.1` |
| cookie-signature | 1.0.7 | 1.2.2 | express: `~1.0.6` |
| debug | 2.6.9 | 4.4.3 | body-parser: `2.6.9`; express: `2.6.9`; finalhandler: `2.6.9`; morgan: `2.6.9`; send: `2.6.9` |
| detect-libc | 1.0.3 | 2.1.2 | @parcel/watcher: `^1.0.3` |
| dotenv | 10.0.0 | 18.0.4 | decap-server: `^10.0.0` |
| estree-walker | 2.0.2 | 3.0.3 | @rollup/pluginutils: `^2.0.2` |
| express | 4.22.3 | 5.2.1 | decap-server: `^4.18.2` |
| finalhandler | 1.3.2 | 2.1.1 | express: `~1.3.1` |
| iconv-lite | 0.4.24 | 0.7.3 | body-parser: `~0.4.24`; raw-body: `~0.4.24` |
| ipaddr.js | 1.9.1 | 2.5.0 | proxy-addr: `1.9.1` |
| is-stream | 2.0.1 | 4.0.1 | winston: `^2.0.0` |
| lightningcss | 1.32.0 | 1.33.0 | @tailwindcss/node: `1.32.0` |
| magic-string | 0.30.21 | 1.4.2 | @tailwindcss/node: `^0.30.21` |
| media-typer | 0.3.0 | 2.0.0 | type-is: `0.3.0` |
| merge-descriptors | 1.0.3 | 2.0.0 | express: `1.0.3` |
| mime | 1.6.0 | 4.1.0 | send: `1.6.0` |
| mime-db | 1.52.0 | 1.54.0 | mime-types: `1.52.0` |
| mime-types | 2.1.35 | 3.0.2 | accepts: `~2.1.34`; type-is: `~2.1.24` |
| ms | 2.0.0 | 2.1.3 | debug: `2.0.0` |
| nanoid | 3.3.19 | 6.0.1 | postcss: `^3.3.18` |
| negotiator | 0.6.3 | 1.1.0 | accepts: `0.6.3` |
| node-addon-api | 7.1.1 | 8.9.2 | @parcel/watcher: `^7.0.0` |
| path-to-regexp | 0.1.13 | 8.4.2 | express: `~0.1.13` |
| picomatch | 2.3.2 | 4.0.7 | micromatch: `^2.3.1` |
| range-parser | 1.2.1 | 1.3.0 | express: `~1.2.1`; send: `~1.2.1` |
| raw-body | 2.5.3 | 4.0.0 | body-parser: `~2.5.3` |
| readable-stream | 3.6.2 | 4.7.0 | winston: `^3.4.0`; winston-transport: `^3.6.2` |
| safe-buffer | 5.1.2 | 5.2.1 | basic-auth: `5.1.2` |
| send | 0.19.2 | 1.2.1 | express: `~0.19.0`; serve-static: `~0.19.1` |
| serve-static | 1.16.3 | 2.2.1 | express: `~1.16.2` |
| simple-git | 3.36.0 | 4.0.1 | decap-server: `^3.0.0` |
| stack-trace | 0.0.10 | 1.0.0 | winston: `0.0.x` |
| type-is | 1.6.18 | 3.0.0 | body-parser: `~1.6.18`; express: `~1.6.18` |

The platform binaries for `@parcel/watcher` are pinned to 2.5.1 by that package (newer releases are 2.6.0, or 2.5.6 for win32-ia32). Tailwind's `lightningcss` 1.32.0 pins its platform binaries to 1.32.0; their current release is 1.33.0. Packages for other operating systems remain in the lockfile and are installed only on matching hosts.

## Ruby constraints

`bundle outdated --strict` reports no updates allowed by the current constraints. The unrestricted report lists these newer, incompatible major versions:

| Gem | Locked | Latest | Upstream requirement |
| --- | --- | --- | --- |
| json | 2.21.2 | 3.0.2 | Jekyll: `~> 2.6` |
| liquid | 4.0.4 | 5.14.0 | Jekyll: `~> 4.0` |
| rouge | 4.7.0 | 5.1.0 | Jekyll: `>= 3.0, < 5.0` |
| terminal-table | 3.0.2 | 4.0.0 | Jekyll: `>= 1.8, < 4.0` |
| unicode-display_width | 2.6.0 | 3.3.0 | terminal-table: `>= 1.1.1, < 3` |

The Windows and Linux native platforms remain in `Gemfile.lock`, which records Bundler 4.0.21.

## Security

`npm audit` reports two low-severity findings in the development-only Decap server dependency chain: `decap-server` and its deprecated `@hapi/joi` dependency ([GHSA-6w3j-5fw6-r9vr](https://github.com/advisories/GHSA-6w3j-5fw6-r9vr)). The latest server still requires `@hapi/joi ^17.0.2`, with no compatible upstream fix. High-severity findings in PostCSS, nanoid, and picomatch were resolved within upstream ranges.

`bundler-audit check --update` found no vulnerable locked gems against ruby-advisory-db commit `fb34fedf8a96f99e54bcfb9306519996a70baa25` (updated September 23, 2026).

## Compatibility changes and verification

- Removed the `github-pages` gem's Jekyll 3 dependency set; GitHub Actions still publishes the generated site to Pages.
- Tailwind 4.3.3 regenerates its utilities before Lightning CSS bundles them. Pico remains responsible for the reset. Fresh `npm ci` installs produce identical CSS outputs; npm 12 install-script approvals are limited to the two required build dependencies.
- Polyglot 1.14 adds language prefixes itself. English page permalinks and the CMS legal-page default are now language-neutral. A clean build removes stale `/en/en/` output.
- The root sitemap now includes both language versions of the home and legal pages, with no duplicate English sitemap.
- Windows: locked gem install, local and production Jekyll builds, and `npm test` pass. The route checks first reproduced the duplicate language prefix and missing English sitemap entries, then passed after the fixes.
- Lychee checked 576 links: zero errors, 14 exclusions, and two redirects, using the existing workflow exclusions.
- Browser checks passed for desktop/mobile layout, language switching, approach panels, contact validation, legal pages, and Decap local login. Sampled desktop dimensions and mobile heading dimensions match the pre-upgrade baseline; no contact message or CMS content was submitted.
- The development launcher starts Jekyll and the locked Decap server, and both stop when the launcher is interrupted.
- Linux execution remains unverified locally because Docker does not work on this Windows setup. The workflow now requires Windows and Linux build checks before deployment. No workflow was dispatched and nothing was deployed.

The working Windows runtime is isolated under `%LOCALAPPDATA%\therapycove-toolchains\msys-ruby\ucrt64`; the existing compiler is under `C:\msys64`. User PATH was not changed. To use this verified toolchain in a new PowerShell session:

```powershell
$env:Path = "$env:LOCALAPPDATA\therapycove-toolchains\msys-ruby\ucrt64\bin;C:\msys64\ucrt64\bin;C:\msys64\usr\bin;$env:Path"
pwsh ./scripts/dev.ps1
```
