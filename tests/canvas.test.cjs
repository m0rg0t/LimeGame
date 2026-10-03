const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');

// This one numeric GML script is also valid JavaScript except for `exit`.
// Only the script-exit keyword is adapted. No copy of its math is executed.
// This is a source-level regression, not a GameMaker compiler/runtime test.
const sourcePath = process.env.CANVAS_SOURCE || path.join(__dirname, '../limeGame1.gmx/scripts/canvas_fullscreen.gml');
const source = fs.readFileSync(sourcePath, 'utf8').replace(/\bexit\s*;/g, 'return;');
const script = new vm.Script('(function () {\n' + source + '\n})();', { filename: sourcePath });
function makeContext() {
  const calls = [];
  const context = vm.createContext({
    view_wport: [640], view_hport: [480],
    view_wview: [1000], view_hview: [750], application_surface: 123,
    window_set_size: (w, h) => calls.push(['window', w, h]),
    window_center: () => calls.push(['center']),
    surface_resize: (id, w, h) => calls.push(['surface', id, w, h]),
  });
  return { context, calls };
}
function run(state, base, width, height) {
  Object.assign(state.context, { argument0: base, argument1: width, argument2: height });
  script.runInContext(state.context, { timeout: 100 });
}
function dimensions(state) {
  return ['view_wport', 'view_hport', 'view_wview', 'view_hview'].map(k => state.context[k][0]);
}
for (const input of [[1000, 0, 600], [1000, 800, 0], [1000, 0, 0],
                     [1000, -1, 600], [1000, 800, -1], [0, 800, 600], [-1, 800, 600]]) {
  const state = makeContext();
  const before = dimensions(state);
  run(state, ...input);
  assert.deepEqual(dimensions(state), before, 'Invalid dimensions must preserve the previous viewport: ' + input);
  assert.equal(state.calls.length, 0, 'Invalid dimensions must not resize windows or surfaces');
  run(state, 1000, 800, 600);
  assert.deepEqual(dimensions(state), [800, 600, 1000, 750], 'A valid viewport must recover after invalid input');
}
for (const [width, height, expectedWidth, expectedHeight] of [
  [800, 600, 1000, 750], [600, 800, 750, 1000], [800, 800, 1000, 1000], [1, 1, 1000, 1000]]) {
  const state = makeContext();
  run(state, 1000, width, height);
  assert.deepEqual(dimensions(state), [width, height, expectedWidth, expectedHeight]);
  assert.deepEqual(state.calls, [['window', width, height], ['center'], ['surface', 123, expectedWidth, expectedHeight]]);
}
console.log('PASS: zero/negative dimensions and base, no invalid side effects, recovery, landscape, portrait, square and minimum positive viewport');
