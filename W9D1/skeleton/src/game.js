import Level from './level.js'
import Bird from './bird.js'
export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart()
  }

  animate() {
    this.level.animate(this.ctx)
    this.bird.animate(this.ctx)
    if (running) {
    requestAnimationFrame(this.animate.bind(this))
    }
  }

  restart() {
    this.level = new Level(this.dimensions)
    this.bird = new Bird(this.dimensions)
    this.animate()

  }

  play() {
    this.running = true
    this.animate()
  }

  click() {
    {if (!running) {
      this.play()
    }
    this.bird.flap()
    const el = document.getElementById("bird-game")
    el.addEventListener("mousedown", this.click.bind(this), false)
  }}
}
