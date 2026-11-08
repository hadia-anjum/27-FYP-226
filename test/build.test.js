const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');

test('out directory contains generated HTML files', () => {
  assert.ok(fs.existsSync('out/greeting.html'));
  assert.ok(fs.existsSync('out/notes.html'));
  assert.ok(fs.existsSync('out/services.html'));
});
