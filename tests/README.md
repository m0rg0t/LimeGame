# Portable regression checks

These tests execute the selected production source using synthetic inputs and explicit platform stubs. They do not start the app, access a sensor, location, network, audio device or real game service.

Run `node tests/canvas.test.cjs` with Node 24.19.0. This uses only built-in modules. It reads the actual `canvas_fullscreen.gml`, adapts only the GML `exit;` statement to a function return, and executes its numeric expressions against explicit window/view/surface stubs. It is a deliberately narrow JavaScript-compatible numeric source test, not a general GML interpreter or native compiler.

Coverage: zero/negative base, width and height preserve all old view dimensions and perform no window/surface calls; valid input subsequently recovers; portrait, landscape, square and minimum positive viewports preserve the original math and call sequence.

[GameMaker exit semantics](https://manual.gamemaker.io/beta/en/GameMaker_Language/GML_Overview/Language_Features/exit.htm): stop this script invocation and return to the caller. Exact historical compiler/export validation still needs the original working editor and HTML5 export environment. No assets, project resources, resize event wiring or generated exports are changed. The existing disabled resize call remains disabled.
