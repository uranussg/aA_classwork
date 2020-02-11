export default class Bird {
  constructor(dimensions) {
    this.velocity = 0;
    this.dimensions = dimensions;
    this.x = 1 / 3 * this.dimensions.width;
    this.y = 1 / 2 * this.dimensions.height;
    // this.position = { x: 1/3 * this.dimensions.width, y: 1/2 * this.dimensions.height }
  }

  drawBird(ctx) {
    ctx.fillStyle = "red";
    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
    // ctx.fillRect(this.position.x - 20, this.position.y - 30, this.position.x + 20, this.position.y );
  }

  animate(ctx) {
    this.move()
    this.drawBird(ctx)
  }

  move() {
    this.y += this.velocity
    this.velocity += CONSTANTS.GRAVITY
  }

  flap() {
    this.velocity = CONSTANTS.FLAP_SPEED
  }
}

const CONSTANTS = {
  GRAVITY:  0.8,
  FLAP_SPEED:  -8,
  TERMINAL_VEL:  12,
  BIRD_WIDTH:  40,
  BIRD_HEIGHT:  30
};