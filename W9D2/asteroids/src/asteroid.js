const Util = require("./utils.js")
const MovingObject = require("./moving_object.js")
const Ship = require("./ship.js")
const Bullet= require("./bullet.js")



function Asteroid(object, game) {
    object.color = CONSTANTS.asteroid.COLOR;
    object.radius = CONSTANTS.asteroid.RADIUS;
    object.vel = Util.randomVec(Math.random() * CONSTANTS.asteroid.MAX_VEL)
    MovingObject.call(this, object, game);
}

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.collideWith = function(otherObject) {
    if (otherObject instanceof Ship) {
        otherObject.relocate()
    }
    if (otherObject instanceof Bullet) {
        this.game.remove(this)
    }
}





module.exports = Asteroid;