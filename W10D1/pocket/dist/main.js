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

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: clock */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"clock\", function() { return clock; });\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\nconstructor() {\n    // 1. Create a Date object.\n    const currentTime = new Date();\n\n    // 2. Store the hour, minute, and second.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    // 3. Call printTime.\n    this.printTime();\n\n    // 4. Schedule the tick at 1 second intervals.\n    // const clockElement = document.getElementById(\"clock\")\n    setInterval(this._tick.bind(this), 1000);\n\n    // htmlGenerator(this.printTime(), clockElement)\n    \n}\n\nprintTime() {\n    // Format the time in HH:MM:SS\n    return  [this.hours, this.minutes, this.seconds].join(\":\");\n\n    // Use console.log to print it.\n    // console.log(timeString);\n}\n\n_tick() {\n    // 1. Increment the time by one second.\n    this._incrementSeconds();\n\n    // 2. Call printTime.\n    // this.printTime();\n    // const clockElement = document.getElementById(\"clock\")\n\n    Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(this.printTime(), clockElement)\n\n}\n\n_incrementSeconds() {\n    // 1. Increment the time by one second.\n    this.seconds += 1;\n    if (this.seconds === 60) {\n    this.seconds = 0;\n    this._incrementMinutes();\n    }\n}\n\n_incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n    this.minutes = 0;\n    this._incrementHours();\n    }\n}\n\n_incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n}\n}\nconst clockElement = document.getElementById(\"clock\")\n\nconst clock = new Clock();\n\n\n\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: dogLinkCreator, attachDogLinks */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"dogLinkCreator\", function() { return dogLinkCreator; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"attachDogLinks\", function() { return attachDogLinks; });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  let links = []\n  Object.keys(dogs).forEach((dog) => {\n    let dogLi = document.createElement(\"li\")\n    let a = document.createElement(\"a\")\n    a.innerHTML = dog\n    a.href = dogs[dog]\n    a.setAttribute(\"class\",\"dog-link\")\n    dogLi.appendChild(a)\n    links.push(dogLi)\n  })\n  return links\n}\n\nfunction attachDogLinks() {\n  const ul = document.getElementsByClassName(\"drop-down-dog-list\")[0]\n  let dogLinks = dogLinkCreator()\n  dogLinks.forEach((li) => {\n    ul.appendChild(li)\n  })\n  function handleEnter() {\n    \n    const trigger = document.getElementsByClassName(\"drop-down-dog-nav\")[0]\n    // debugger\n    trigger.addEventListener('mouseenter', () =>{\n      // console.log(\"here\")\n      event.preventDefault()\n      event.stopPropagation()\n      // debugger\n      let list = event.currentTarget.querySelectorAll(\"a\")\n      list.forEach((child) => {\n        child.setAttribute(\"class\", \"\")\n      })\n    }) \n  }\n  \n  function handleLeave() {\n    const trigger = document.getElementsByClassName(\"drop-down-dog-nav\")[0]\n    trigger.addEventListener(\"mouseleave\", () =>{\n      event.preventDefault()\n      event.stopPropagation()\n      let list = event.currentTarget.querySelectorAll(\"a\")\n      list.forEach((child) => {\n        // child.removeClass(\"dog-link\")\n        child.setAttribute(\"class\", \"dog-link\")\n      })\n    }) \n  \n  }\n  handleEnter()\n  handleLeave()\n}\n\n\nattachDogLinks()\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n/* harmony import */ var _slide_scroll__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./slide_scroll */ \"./src/slide_scroll.js\");\n/* harmony import */ var _slide_scroll__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_slide_scroll__WEBPACK_IMPORTED_MODULE_4__);\n/* harmony import */ var _search__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./search */ \"./src/search.js\");\n/* harmony import */ var _search__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(_search__WEBPACK_IMPORTED_MODULE_5__);\n\n\n\n\n\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/search.js":
/*!***********************!*\
  !*** ./src/search.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const pokemonAPI = 'https://pokeapi.co/api/v2/pokemon/?offset=150&limit=150'\n\n\nconst resps = []\nfetch(pokemonAPI).then((response)=>{\n    return response.json()\n})\n.then((myjson) => {\n//   debugger\n//   console.log(`${myjson.results[0]}`)\nmyjson.results.forEach((el)=>{\n\n    resps.push(el);\n})\n console.log(`${resps.length}`)\n})\n;\nfunction findMatches(word) {\n    \n    \n    // debugger\n    let rex = new RegExp(word)\n    let matched = []\n    resps.forEach((res) => {\n        console.log(`${Object.keys(res)}`)\n        if (res.name.match(rex)) matched.push(res)\n    })\n    // debugger\n    return matched\n}\n\n\nfunction displayMatches() {\n\n    let trigger = document.getElementsByClassName(\"search\")[0]\n    trigger.addEventListener(\"keyup\",()=>{\n        event.stopPropagation()\n        event.preventDefault()\n        let word = trigger.value\n        debugger\n        let matchArray = findMatches(word)\n        let ul = document.getElementsByClassName(\"suggestions\")[0]\n        // debugger\n        matchArray.forEach((po) => {\n            // debugger\n            let li = document.createElement(\"li\")\n            let a = document.createElement(\"a\")\n            a.innerHTML = po.name\n            a.src = po.url  \n            li.append(a)\n            ul.append(li)\n        })\n\n    })\n\n}\n\n\ndisplayMatches()\n\n//# sourceURL=webpack:///./src/search.js?");

/***/ }),

/***/ "./src/slide_scroll.js":
/*!*****************************!*\
  !*** ./src/slide_scroll.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function debounce(func, wait = 20, immediate = true) {\n  let timeout;\n\n  // This is the function that is actually executed when\n  // the DOM event is triggered.\n  return function executedFunction() {\n    // Store the context of this and any\n    // parameters passed to executedFunction\n    const context = this;\n    const args = arguments;\n\n    // The function to be called after debounce time has elapsed\n    const later = function () {\n      // null timeout to indicate the debounce ended\n      timeout = null;\n\n      // Call function now if you did not in the beginning\n      if (!immediate) func.apply(context, args);\n    };\n\n    // Determine if you should call the function\n    // on the leading or trail end\n    const callNow = immediate && !timeout;\n\n    // This will reset the waiting every function execution.\n    clearTimeout(timeout);\n\n    // Restart the debounce waiting period - returns true\n    timeout = setTimeout(later, wait);\n\n    // Call immediately if you're doing a leading end execution\n    if (callNow) func.apply(context, args);\n  };\n}\n\n\nwindow.addEventListener(\"scroll\", debounce(() => {\n  console.log('how many times')\n  y0 = window.innerHeight\n  const imgs = document.querySelectorAll(\"[class*=align]\")\n  imgs.forEach((img) => {\n    let distances = img.getBoundingClientRect()\n    let currentClass = img.getAttribute('class').split(\" \") \n    if (distances.top > -distances.height / 2 && distances.top < y0 -distances.height/2){\n      if (!currentClass.includes(\"active\"))\n         {img.setAttribute('class', currentClass.join(\" \") + \" active\")}\n    }\n    else {\n      idx = currentClass.indexOf(\"active\")\n      if(idx> -1) {\n        currentClass.splice(idx, 1)\n        img.setAttribute('class', currentClass.join(\" \"))\n      }\n    }\n  })\n\n\n})\n)\n\n//# sourceURL=webpack:///./src/slide_scroll.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const todos = JSON.parse(localStorage.getItem('todos')) || []\n\nwindow.todos = todos\n\nclass ToDos {\n    constructor(val){\n        this.done = false\n        this.val = val\n    }\n}\n\nfunction addTodo() {\n    let el = document.getElementsByName(\"add-todo\")[0]\n    todos.push(new ToDos(el.value))\n    el.setAttribute(\"value\", \"\")\n    localStorage.setItem('todos', JSON.stringify(todos))\n    populateList()\n}\n\nlet ul = document.getElementsByClassName('todos')[0]\nfunction populateList() {\n    todos.forEach(todo => {\n        // debugger\n        let outLi = document.createElement('li')\n        let input = document.createElement(\"input\")\n        input.setAttribute(\"type\", \"checkbox\")\n        if (todo.done) input.setAttribute(\"checked\", 'true');\n        let la = document.createElement(\"label\")\n        la.innerHTML = todo.val\n        outLi.appendChild(input)\n        outLi.appendChild(la)\n        ul.appendChild(outLi)\n    });\n}\n\n\nlet submit = document.querySelector(\"[type=submit]\")\n\n\nsubmit.addEventListener('click', ()=>{\n    addTodo()\n})\n\nul.addEventListener('click', ()=> {\n    // debugger\n\n    for (let i = 1; i< ul.children.length; i++) {\n        let box = ul.children[i].querySelector(\"input\")\n        if (box.checked) todos[i - 1].done = true;\n    }\n    localStorage.setItem('todos', JSON.stringify(todos))\n\n})\npopulateList()\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n    if (htmlElement.children) {\n        Array.from(htmlElement.children).forEach((el) => {\n\n            htmlElement.removeChild(el)\n        })\n    }\n    let p = document.createElement(\"p\")\n    let str = document.createTextNode(string)\n    p.appendChild(str)\n    htmlElement.appendChild(p)\n};\n\nhtmlGenerator('Party Time.', partyHeader);\nconst h1 = document.querySelector(\"h1\")\nhtmlGenerator(\"I <3 Vanilla DOM manipulation.\", h1)\n\n\ndocument.query\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });