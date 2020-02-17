const Asteroid = require("./asteroid.js")
const Ship = require("./ship.js")
const Bullet = require("./bullet.js")

function Game() {
    this.DIM_X = CONSTANTS.DIM_X;
    this.DIM_Y = CONSTANTS.DIM_Y;
    this.NUM_ASTEROIDS = CONSTANTS.NUM_ASTEROIDS;
    this.asteroids = []
    this.addAsteroids()
    this.ship = new Ship(this.randomPosition(), this)
    // this.allObjects = this.asteroids.concat([this.ship]).concat(this.bullet)
    this.bullet = []
}

// Game.prototype.asteroids = function() {
//     return this.asteroids.concat([this.ship])
// }
Game.prototype.allObjects = function() {
    return this.asteroids.concat([this.ship]).concat(this.bullet)
}


Game.prototype.randomPosition = function() {
    return { pos: [Math.random() * this.DIM_X, Math.random() * this.DIM_Y]}
}

Game.prototype.add = function(obj) {
    if (obj instanceof Bullet) {
        this.bullet.push(obj)
    }
}

Game.prototype.addAsteroids = function(){
    for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
        let temp = new Asteroid(this.randomPosition(), this)
        this.asteroids.push(temp)
    }
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,this.DIM_X,this.DIM_Y)
    // debugger
    this.allObjects().forEach(asteroid => {
        asteroid.draw(ctx)})
}

Game.prototype.moveObjects = function() {
    // debugger
    this.allObjects().forEach(asteroid => asteroid.move())
}

Game.prototype.wrap = function(pos) {
    let newPos = [(pos[0] + this.DIM_X) % this.DIM_X, (pos[1] + this.DIM_Y) % this.DIM_Y ]
    return newPos
}

Game.prototype.checkCollisions = function() {
    for (let i = 0; i < this.allObjects().length - 1; i++) {
        for (let j = i + 1; j < this.allObjects().length; j++) {
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {
                this.allObjects()[i].collideWith(this.allObjects()[j])
                // console.log(`${this.allObjects()[i].color} and ${this.allObjects()[j].color}`)
                // debugger
            }
        }
    }
}

Game.prototype.step = function() {
    this.moveObjects()
    this.checkCollisions()
}

Game.prototype.remove = function(asteroid) {
    // const index = this.asteroids.indexOf(asteroid)
    // this.asteroids.splice(index, 1)

    for (let i=0; i < this.asteroids.length; i++) {
        if (this.asteroids[i].pos === asteroid.pos) {
            this.asteroids.splice(i, 1)
            console.log(`${asteroid.color} has been removed`)
            break
        }
    }
}

module.exports = Game;
