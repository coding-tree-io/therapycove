import assert from 'node:assert/strict';
import { existsSync, readFileSync } from 'node:fs';

const baseUrl = process.argv[2] ?? '';
const pages = [
  ['/', 'el', 'Ένας χώρος για σένα'],
  ['/en/', 'en', 'A space for you'],
  ['/legal/', 'el', 'Πολιτική Απορρήτου'],
  ['/en/legal/', 'en', 'Privacy & Legal Notice'],
];

for (const [route, lang, heading] of pages) {
  const html = readFileSync(`_site${route}index.html`, 'utf8');
  assert.ok(html.includes(`<html lang="${lang}"`), `${route}: wrong language`);
  assert.ok(html.includes(heading), `${route}: missing localized content`);
  const canonical = html.match(/<link rel="canonical" href="([^"]+)"/)?.[1];
  assert.equal(canonical, `${baseUrl}${route}`, `${route}: wrong canonical URL`);
  assert.ok(!html.includes('/en/en/'), `${route}: duplicated language prefix`);
  const structuredData = html.match(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/)?.[1];
  assert.equal(JSON.parse(structuredData)['@type'], 'PsychologicalService');
}

assert.ok(!existsSync('_site/en/en'), 'Polyglot emitted duplicate English routes');
assert.ok(!existsSync('_site/node_modules'), 'Development dependencies were published');
assert.ok(!existsSync('_site/scripts'), 'Development scripts were published');
assert.ok(!existsSync('_site/DEPENDENCY_UPDATES.md'), 'Maintenance notes were published');
const sitemap = readFileSync('_site/sitemap.xml', 'utf8');
const urls = [...sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)].map(match => match[1]);
assert.deepEqual(urls.sort(), pages.map(([route]) => `${baseUrl}${route}`).sort(), 'Sitemap must include both languages');
assert.ok(!existsSync('_site/en/sitemap.xml'), 'Only the root bilingual sitemap should be generated');
console.log('Bilingual routes, canonical URLs, structured data, sitemap, and exclusions passed.');
