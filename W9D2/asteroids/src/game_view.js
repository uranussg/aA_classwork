const Game = require("./game.js")
const keymaster = require("./keymaster.js")

function GameView(ctx) {
    this.ctx = ctx
    this.game = new Game()
}

GameView.prototype.start = function() {
    setInterval(this.game.step.bind(this.game),20);
    setInterval(this.game.draw.bind(this.game),20, this.ctx);
    this.bindKeyHandlers()
}

GameView.prototype.bindKeyHandlers = function() {
    let ship = this.game.ship
    key('w', function() {ship.power.bind(ship)([0, -2])});
    key('s', function() {ship.power.bind(ship)([0, 2])});
    key('a', function() {ship.power.bind(ship)([-2, 0])});
    key('d', function() {ship.power.bind(ship)([2, 0])});

    key('j', function() {ship.fireBullet()})
}

module.exports = GameView;