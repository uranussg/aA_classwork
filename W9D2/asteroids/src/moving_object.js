function MovingObject(object, game) { 
    this.pos = object.pos;
    this.vel = object.vel;
    this.radius = object.radius;
    this.color = object.color;
    this.game = game;
}

MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    ctx.arc(this.pos[0],this.pos[1],this.radius, 0, 2 * Math.PI)
    ctx.fillStyle = this.color;
    ctx.closePath();
    ctx.fill()
    // ctx.lineWidth = 5
    // ctx.strokeStyle = "black"
    // ctx.stroke()
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0]
    this.pos[1] += this.vel[1]
    this.pos = this.game.wrap(this.pos)
}

MovingObject.prototype.isCollidedWith = function(otherObject) {

    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)
    return distance < this.radius + otherObject.radius
}

MovingObject.prototype.collideWith = function(otherObject) {
    
}

module.exports = MovingObject;