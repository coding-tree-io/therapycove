# Vendored dependencies

| Library | Version | Distribution source |
| --- | --- | --- |
| Pico CSS | 2.1.1 | https://unpkg.com/@picocss/pico@2.1.1/css/pico.min.css |
| Scrollama | 3.2.0 | https://unpkg.com/scrollama@3.2.0/build/scrollama.min.js |
| Flowbite | 4.0.2 | `node_modules/flowbite/dist/flowbite.min.js` |
| Coding Tree attribution | 0.1.0 | Existing project asset; no verified upstream release channel |

Pico, Scrollama, and Flowbite retain their upstream MIT licenses beside the distributions. Pico supplies the base stylesheet; Scrollama drives the mobile approach panels. Flowbite's Tailwind plugin is used during compilation; its vendored JavaScript is retained but is not loaded by the current layout.

When upgrading Flowbite, copy both its distribution and license from the installed package. Rebuild and commit both generated CSS files after updating CSS dependencies. Leave the attribution component unchanged until an authoritative upstream release is available.
