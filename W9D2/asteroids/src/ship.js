const Util = require("./utils.js")
const MovingObject = require("./moving_object.js")
const Bullet = require("./bullet.js")


function Ship(object, game) {
    object.color = CONSTANTS.ship.COLOR;
    object.radius = CONSTANTS.ship.RADIUS;
    object.vel = [0, 0]
    MovingObject.call(this, object, game);
}

Util.inherits(Ship, MovingObject)

Ship.prototype.relocate = function() {
    this.pos = this.game.randomPosition().pos
}

Ship.prototype.power = function(impulse) {
    this.vel[0] += impulse[0]
    this.vel[1] += impulse[1]
}

Ship.prototype.fireBullet = function() {
    let vel = this.vel.concat([])
    let bullet = new Bullet({pos: this.pos, vel:vel}, this.game)
    this.game.add(bullet)
}
 
module.exports = Ship;

