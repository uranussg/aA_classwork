// const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js")
// const Util = require("./utils.js");
const GameView = require("./game_view.js")
const Ship = require("./ship.js")

// window.MovingObject = MovingObject;
const canvas = document.getElementById("asteroids-canvas")

const ctx = canvas.getContext("2d")
CONSTANTS = { DIM_X: canvas.width, DIM_Y: canvas.height, NUM_ASTEROIDS: 8, 
    asteroid: { COLOR: "red", RADIUS: 20, MAX_VEL: 10 },
    ship: { COLOR: "pink", RADIUS: 15},
    bullet: { COLOR: "black", RADIUS: 5 }

}


// movingobject1 = new MovingObject({
//     pos:[100,200], vel:[1,1], radius: 50, color:"pink"
// })

// window.movingobject1 = movingobject1
// movingobject1.draw(ctx)

// asteroid1 = new Asteroid({ pos: [30, 30] })
// window.asteroid1 = asteroid1
// asteroid1.draw(ctx)

game1 = new GameView(ctx);
game1.start();
window.ctx = ctx
window.game1 = game1
window.Asteroid = Asteroid
window.Ship = Ship