/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet= __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\n\n\nfunction Asteroid(object, game) {\n    object.color = CONSTANTS.asteroid.COLOR;\n    object.radius = CONSTANTS.asteroid.RADIUS;\n    object.vel = Util.randomVec(Math.random() * CONSTANTS.asteroid.MAX_VEL)\n    MovingObject.call(this, object, game);\n}\n\nUtil.inherits(Asteroid, MovingObject)\n\nAsteroid.prototype.collideWith = function(otherObject) {\n    if (otherObject instanceof Ship) {\n        otherObject.relocate()\n    }\n    if (otherObject instanceof Bullet) {\n        this.game.remove(this)\n    }\n}\n\n\n\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n// const Asteroid = require(\"./asteroid.js\")\n\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n\nfunction Bullet(object, game) {\n    object.color = CONSTANTS.bullet.COLOR;\n    object.radius = CONSTANTS.bullet.RADIUS;\n    MovingObject.call(this, object, game);\n}\n\nUtil.inherits(Bullet, MovingObject)\n\n// Bullet.prototype.collideWith = function(otherObject) {\n    // console.log(`${otherObject instanceof Asteroid}`)\n//     if (otherObject instanceof Asteroid) {\n//         this.game.remove(otherObject)\n//     }\n// }\n\n\n// Bullet.prototype.collideWith = function(otherObject) {\n//     debugger\n//     if (otherObject instanceof Asteroid) {\n//         this.game.remove(otherObject)\n//     }\n// }\n\n// Bullet.prototype.check = function(obj) {\n//     return obj instanceof Asteroid\n// }\n\nmodule.exports = Bullet;\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\nfunction Game() {\n    this.DIM_X = CONSTANTS.DIM_X;\n    this.DIM_Y = CONSTANTS.DIM_Y;\n    this.NUM_ASTEROIDS = CONSTANTS.NUM_ASTEROIDS;\n    this.asteroids = []\n    this.addAsteroids()\n    this.ship = new Ship(this.randomPosition(), this)\n    // this.allObjects = this.asteroids.concat([this.ship]).concat(this.bullet)\n    this.bullet = []\n}\n\n// Game.prototype.asteroids = function() {\n//     return this.asteroids.concat([this.ship])\n// }\nGame.prototype.allObjects = function() {\n    return this.asteroids.concat([this.ship]).concat(this.bullet)\n}\n\n\nGame.prototype.randomPosition = function() {\n    return { pos: [Math.random() * this.DIM_X, Math.random() * this.DIM_Y]}\n}\n\nGame.prototype.add = function(obj) {\n    if (obj instanceof Bullet) {\n        this.bullet.push(obj)\n    }\n}\n\nGame.prototype.addAsteroids = function(){\n    for(let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        let temp = new Asteroid(this.randomPosition(), this)\n        this.asteroids.push(temp)\n    }\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0,0,this.DIM_X,this.DIM_Y)\n    // debugger\n    this.allObjects().forEach(asteroid => {\n        asteroid.draw(ctx)})\n}\n\nGame.prototype.moveObjects = function() {\n    // debugger\n    this.allObjects().forEach(asteroid => asteroid.move())\n}\n\nGame.prototype.wrap = function(pos) {\n    let newPos = [(pos[0] + this.DIM_X) % this.DIM_X, (pos[1] + this.DIM_Y) % this.DIM_Y ]\n    return newPos\n}\n\nGame.prototype.checkCollisions = function() {\n    for (let i = 0; i < this.allObjects().length - 1; i++) {\n        for (let j = i + 1; j < this.allObjects().length; j++) {\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {\n                this.allObjects()[i].collideWith(this.allObjects()[j])\n                // console.log(`${this.allObjects()[i].color} and ${this.allObjects()[j].color}`)\n                // debugger\n            }\n        }\n    }\n}\n\nGame.prototype.step = function() {\n    this.moveObjects()\n    this.checkCollisions()\n}\n\nGame.prototype.remove = function(asteroid) {\n    // const index = this.asteroids.indexOf(asteroid)\n    // this.asteroids.splice(index, 1)\n\n    for (let i=0; i < this.asteroids.length; i++) {\n        if (this.asteroids[i].pos === asteroid.pos) {\n            this.asteroids.splice(i, 1)\n            console.log(`${asteroid.color} has been removed`)\n            break\n        }\n    }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst keymaster = __webpack_require__(/*! ./keymaster.js */ \"./src/keymaster.js\")\n\nfunction GameView(ctx) {\n    this.ctx = ctx\n    this.game = new Game()\n}\n\nGameView.prototype.start = function() {\n    setInterval(this.game.step.bind(this.game),20);\n    setInterval(this.game.draw.bind(this.game),20, this.ctx);\n    this.bindKeyHandlers()\n}\n\nGameView.prototype.bindKeyHandlers = function() {\n    let ship = this.game.ship\n    key('w', function() {ship.power.bind(ship)([0, -2])});\n    key('s', function() {ship.power.bind(ship)([0, 2])});\n    key('a', function() {ship.power.bind(ship)([-2, 0])});\n    key('d', function() {ship.power.bind(ship)([2, 0])});\n\n    key('j', function() {ship.fireBullet()})\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const MovingObject = require(\"./moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n// const Util = require(\"./utils.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\n// window.MovingObject = MovingObject;\nconst canvas = document.getElementById(\"asteroids-canvas\")\n\nconst ctx = canvas.getContext(\"2d\")\nCONSTANTS = { DIM_X: canvas.width, DIM_Y: canvas.height, NUM_ASTEROIDS: 8, \n    asteroid: { COLOR: \"red\", RADIUS: 20, MAX_VEL: 10 },\n    ship: { COLOR: \"pink\", RADIUS: 15},\n    bullet: { COLOR: \"black\", RADIUS: 5 }\n\n}\n\n\n// movingobject1 = new MovingObject({\n//     pos:[100,200], vel:[1,1], radius: 50, color:\"pink\"\n// })\n\n// window.movingobject1 = movingobject1\n// movingobject1.draw(ctx)\n\n// asteroid1 = new Asteroid({ pos: [30, 30] })\n// window.asteroid1 = asteroid1\n// asteroid1.draw(ctx)\n\ngame1 = new GameView(ctx);\ngame1.start();\nwindow.ctx = ctx\nwindow.game1 = game1\nwindow.Asteroid = Asteroid\nwindow.Ship = Ship\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/keymaster.js":
/*!**************************!*\
  !*** ./src/keymaster.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("//     keymaster.js\n//     (c) 2011-2013 Thomas Fuchs\n//     keymaster.js may be freely distributed under the MIT license.\n\n; (function (global) {\n    var k,\n        _handlers = {},\n        _mods = { 16: false, 18: false, 17: false, 91: false },\n        _scope = 'all',\n        // modifier keys\n        _MODIFIERS = {\n            '⇧': 16, shift: 16,\n            '⌥': 18, alt: 18, option: 18,\n            '⌃': 17, ctrl: 17, control: 17,\n            '⌘': 91, command: 91\n        },\n        // special keys\n        _MAP = {\n            backspace: 8, tab: 9, clear: 12,\n            enter: 13, 'return': 13,\n            esc: 27, escape: 27, space: 32,\n            left: 37, up: 38,\n            right: 39, down: 40,\n            del: 46, 'delete': 46,\n            home: 36, end: 35,\n            pageup: 33, pagedown: 34,\n            ',': 188, '.': 190, '/': 191,\n            '`': 192, '-': 189, '=': 187,\n            ';': 186, '\\'': 222,\n            '[': 219, ']': 221, '\\\\': 220\n        },\n        code = function (x) {\n            return _MAP[x] || x.toUpperCase().charCodeAt(0);\n        },\n        _downKeys = [];\n\n    for (k = 1; k < 20; k++) _MAP['f' + k] = 111 + k;\n\n    // IE doesn't support Array#indexOf, so have a simple replacement\n    function index(array, item) {\n        var i = array.length;\n        while (i--) if (array[i] === item) return i;\n        return -1;\n    }\n\n    // for comparing mods before unassignment\n    function compareArray(a1, a2) {\n        if (a1.length != a2.length) return false;\n        for (var i = 0; i < a1.length; i++) {\n            if (a1[i] !== a2[i]) return false;\n        }\n        return true;\n    }\n\n    var modifierMap = {\n        16: 'shiftKey',\n        18: 'altKey',\n        17: 'ctrlKey',\n        91: 'metaKey'\n    };\n    function updateModifierKey(event) {\n        for (k in _mods) _mods[k] = event[modifierMap[k]];\n    };\n\n    // handle keydown event\n    function dispatch(event) {\n        var key, handler, k, i, modifiersMatch, scope;\n        key = event.keyCode;\n\n        if (index(_downKeys, key) == -1) {\n            _downKeys.push(key);\n        }\n\n        // if a modifier key, set the key.<modifierkeyname> property to true and return\n        if (key == 93 || key == 224) key = 91; // right command on webkit, command on Gecko\n        if (key in _mods) {\n            _mods[key] = true;\n            // 'assignKey' from inside this closure is exported to window.key\n            for (k in _MODIFIERS) if (_MODIFIERS[k] == key) assignKey[k] = true;\n            return;\n        }\n        updateModifierKey(event);\n\n        // see if we need to ignore the keypress (filter() can can be overridden)\n        // by default ignore key presses if a select, textarea, or input is focused\n        if (!assignKey.filter.call(this, event)) return;\n\n        // abort if no potentially matching shortcuts found\n        if (!(key in _handlers)) return;\n\n        scope = getScope();\n\n        // for each potential shortcut\n        for (i = 0; i < _handlers[key].length; i++) {\n            handler = _handlers[key][i];\n\n            // see if it's in the current scope\n            if (handler.scope == scope || handler.scope == 'all') {\n                // check if modifiers match if any\n                modifiersMatch = handler.mods.length > 0;\n                for (k in _mods)\n                    if ((!_mods[k] && index(handler.mods, +k) > -1) ||\n                        (_mods[k] && index(handler.mods, +k) == -1)) modifiersMatch = false;\n                // call the handler and stop the event if neccessary\n                if ((handler.mods.length == 0 && !_mods[16] && !_mods[18] && !_mods[17] && !_mods[91]) || modifiersMatch) {\n                    if (handler.method(event, handler) === false) {\n                        if (event.preventDefault) event.preventDefault();\n                        else event.returnValue = false;\n                        if (event.stopPropagation) event.stopPropagation();\n                        if (event.cancelBubble) event.cancelBubble = true;\n                    }\n                }\n            }\n        }\n    };\n\n    // unset modifier keys on keyup\n    function clearModifier(event) {\n        var key = event.keyCode, k,\n            i = index(_downKeys, key);\n\n        // remove key from _downKeys\n        if (i >= 0) {\n            _downKeys.splice(i, 1);\n        }\n\n        if (key == 93 || key == 224) key = 91;\n        if (key in _mods) {\n            _mods[key] = false;\n            for (k in _MODIFIERS) if (_MODIFIERS[k] == key) assignKey[k] = false;\n        }\n    };\n\n    function resetModifiers() {\n        for (k in _mods) _mods[k] = false;\n        for (k in _MODIFIERS) assignKey[k] = false;\n    };\n\n    // parse and assign shortcut\n    function assignKey(key, scope, method) {\n        var keys, mods;\n        keys = getKeys(key);\n        if (method === undefined) {\n            method = scope;\n            scope = 'all';\n        }\n\n        // for each shortcut\n        for (var i = 0; i < keys.length; i++) {\n            // set modifier keys if any\n            mods = [];\n            key = keys[i].split('+');\n            if (key.length > 1) {\n                mods = getMods(key);\n                key = [key[key.length - 1]];\n            }\n            // convert to keycode and...\n            key = key[0]\n            key = code(key);\n            // ...store handler\n            if (!(key in _handlers)) _handlers[key] = [];\n            _handlers[key].push({ shortcut: keys[i], scope: scope, method: method, key: keys[i], mods: mods });\n        }\n    };\n\n    // unbind all handlers for given key in current scope\n    function unbindKey(key, scope) {\n        var multipleKeys, keys,\n            mods = [],\n            i, j, obj;\n\n        multipleKeys = getKeys(key);\n\n        for (j = 0; j < multipleKeys.length; j++) {\n            keys = multipleKeys[j].split('+');\n\n            if (keys.length > 1) {\n                mods = getMods(keys);\n            }\n\n            key = keys[keys.length - 1];\n            key = code(key);\n\n            if (scope === undefined) {\n                scope = getScope();\n            }\n            if (!_handlers[key]) {\n                return;\n            }\n            for (i = 0; i < _handlers[key].length; i++) {\n                obj = _handlers[key][i];\n                // only clear handlers if correct scope and mods match\n                if (obj.scope === scope && compareArray(obj.mods, mods)) {\n                    _handlers[key][i] = {};\n                }\n            }\n        }\n    };\n\n    // Returns true if the key with code 'keyCode' is currently down\n    // Converts strings into key codes.\n    function isPressed(keyCode) {\n        if (typeof (keyCode) == 'string') {\n            keyCode = code(keyCode);\n        }\n        return index(_downKeys, keyCode) != -1;\n    }\n\n    function getPressedKeyCodes() {\n        return _downKeys.slice(0);\n    }\n\n    function filter(event) {\n        var tagName = (event.target || event.srcElement).tagName;\n        // ignore keypressed in any elements that support keyboard data input\n        return !(tagName == 'INPUT' || tagName == 'SELECT' || tagName == 'TEXTAREA');\n    }\n\n    // initialize key.<modifier> to false\n    for (k in _MODIFIERS) assignKey[k] = false;\n\n    // set current scope (default 'all')\n    function setScope(scope) { _scope = scope || 'all' };\n    function getScope() { return _scope || 'all' };\n\n    // delete all handlers for a given scope\n    function deleteScope(scope) {\n        var key, handlers, i;\n\n        for (key in _handlers) {\n            handlers = _handlers[key];\n            for (i = 0; i < handlers.length;) {\n                if (handlers[i].scope === scope) handlers.splice(i, 1);\n                else i++;\n            }\n        }\n    };\n\n    // abstract key logic for assign and unassign\n    function getKeys(key) {\n        var keys;\n        key = key.replace(/\\s/g, '');\n        keys = key.split(',');\n        if ((keys[keys.length - 1]) == '') {\n            keys[keys.length - 2] += ',';\n        }\n        return keys;\n    }\n\n    // abstract mods logic for assign and unassign\n    function getMods(key) {\n        var mods = key.slice(0, key.length - 1);\n        for (var mi = 0; mi < mods.length; mi++)\n            mods[mi] = _MODIFIERS[mods[mi]];\n        return mods;\n    }\n\n    // cross-browser events\n    function addEvent(object, event, method) {\n        if (object.addEventListener)\n            object.addEventListener(event, method, false);\n        else if (object.attachEvent)\n            object.attachEvent('on' + event, function () { method(window.event) });\n    };\n\n    // set the handlers globally on document\n    addEvent(document, 'keydown', function (event) { dispatch(event) }); // Passing _scope to a callback to ensure it remains the same by execution. Fixes #48\n    addEvent(document, 'keyup', clearModifier);\n\n    // reset modifiers to false whenever the window is (re)focused.\n    addEvent(window, 'focus', resetModifiers);\n\n    // store previously defined key\n    var previousKey = global.key;\n\n    // restore previously defined key and return reference to our key object\n    function noConflict() {\n        var k = global.key;\n        global.key = previousKey;\n        return k;\n    }\n\n    // set window.key and window.key.set/get/deleteScope, and the default filter\n    global.key = assignKey;\n    global.key.setScope = setScope;\n    global.key.getScope = getScope;\n    global.key.deleteScope = deleteScope;\n    global.key.filter = filter;\n    global.key.isPressed = isPressed;\n    global.key.getPressedKeyCodes = getPressedKeyCodes;\n    global.key.noConflict = noConflict;\n    global.key.unbind = unbindKey;\n\n    if (true) module.exports = assignKey;\n\n})(this);\n\n//# sourceURL=webpack:///./src/keymaster.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(object, game) { \n    this.pos = object.pos;\n    this.vel = object.vel;\n    this.radius = object.radius;\n    this.color = object.color;\n    this.game = game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    ctx.arc(this.pos[0],this.pos[1],this.radius, 0, 2 * Math.PI)\n    ctx.fillStyle = this.color;\n    ctx.closePath();\n    ctx.fill()\n    // ctx.lineWidth = 5\n    // ctx.strokeStyle = \"black\"\n    // ctx.stroke()\n}\n\nMovingObject.prototype.move = function() {\n    this.pos[0] += this.vel[0]\n    this.pos[1] += this.vel[1]\n    this.pos = this.game.wrap(this.pos)\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n\n    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)\n    return distance < this.radius + otherObject.radius\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n    \n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\n\n\nfunction Ship(object, game) {\n    object.color = CONSTANTS.ship.COLOR;\n    object.radius = CONSTANTS.ship.RADIUS;\n    object.vel = [0, 0]\n    MovingObject.call(this, object, game);\n}\n\nUtil.inherits(Ship, MovingObject)\n\nShip.prototype.relocate = function() {\n    this.pos = this.game.randomPosition().pos\n}\n\nShip.prototype.power = function(impulse) {\n    this.vel[0] += impulse[0]\n    this.vel[1] += impulse[1]\n}\n\nShip.prototype.fireBullet = function() {\n    let vel = this.vel.concat([])\n    let bullet = new Bullet({pos: this.pos, vel:vel}, this.game)\n    this.game.add(bullet)\n}\n \nmodule.exports = Ship;\n\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        const surrogate = function(){}\n        surrogate.prototype = parentClass.prototype\n        childClass.prototype = new surrogate()\n        childClass.prototype.constructor = childClass\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });