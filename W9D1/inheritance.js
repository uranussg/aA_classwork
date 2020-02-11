Function.prototype.inherits = function (SuperClass) {
  // Surrogate = function () { };
  // Surrogate.prototype = SuperClass.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
};

function MovingObject() { }

MovingObject.prototype.velocity = function(v) {
  console.log(`My velocity is: ${v}`);
}

function Ship() { }
Ship.inherits(MovingObject);

Ship.prototype.hull = function (material) {
  console.log(`My hull is made from: ${material}`);
}

function Asteroid() { }
Asteroid.inherits(MovingObject);

moving_obj = new MovingObject();

s = new Ship();

// s.velocity("100000");
// moving_obj.hull("wood");