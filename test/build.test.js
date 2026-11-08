const assert = require('assert');
const fs = require('fs');
const path = require('path');

// Test simulation for build and page count assertion
const buildPath = path.join(__dirname, '../dist/index.html');

console.log('Running build and test verification...');

// Simulate test failure by expecting an invalid page count (999)
const expectedPages = 999;
const actualPages = 1;

try {
    assert.strictEqual(actualPages, expectedPages, `Expected ${expectedPages} pages but found ${actualPages}`);
    console.log('Tests passed successfully.');
} catch (error) {
    console.error('Test failed:', error.message);
    process.exit(1);
}
