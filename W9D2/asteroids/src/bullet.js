const Util = require("./utils.js")
const MovingObject = require("./moving_object.js")
// const Asteroid = require("./asteroid.js")

const Asteroid = require("./asteroid.js")

function Bullet(object, game) {
    object.color = CONSTANTS.bullet.COLOR;
    object.radius = CONSTANTS.bullet.RADIUS;
    MovingObject.call(this, object, game);
}

Util.inherits(Bullet, MovingObject)

// Bullet.prototype.collideWith = function(otherObject) {
    // console.log(`${otherObject instanceof Asteroid}`)
//     if (otherObject instanceof Asteroid) {
//         this.game.remove(otherObject)
//     }
// }


// Bullet.prototype.collideWith = function(otherObject) {
//     debugger
//     if (otherObject instanceof Asteroid) {
//         this.game.remove(otherObject)
//     }
// }

// Bullet.prototype.check = function(obj) {
//     return obj instanceof Asteroid
// }

module.exports = Bullet;
