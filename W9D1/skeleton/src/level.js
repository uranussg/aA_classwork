export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.pipes = [0, 0 + CONSTANTS.PIPE_PAIR, 0 + 2 * CONSTANTS.PIPE_PAIR]
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  movePipes() {
    for(let i = 0; i < this.pipes.length; i++) {
      this.pipes[i] += CONSTANTS.PIPE_VELOCITY
    }
    while (true) {
      if(this.pipes[0] + CONSTANTS.PIPE_WIDTH <= 0 ) {
      this.pipes.shift
      this.pipes.push(this.pipes[this.pipes.length - 1] + CONSTANTS.PIPE_PAIR)
      }
      else{break}
    }
  }

  drawPipes(ctx) {
    ctx.fillStyle = "brown";
    this.pipes.forEach(pipex => {
      ctx.fillRect(pipex, 0, CONSTANTS.PIPE_WIDTH, (this.dimensions.height - CONSTANTS.GAP)/2)
      ctx.fillRect(pipex, (this.dimensions.height + CONSTANTS.GAP)/2, CONSTANTS.PIPE_WIDTH, (this.dimensions.height - CONSTANTS.GAP)/2)

    });
    ctx.fillRect()
  }
  
  animate(ctx) {
    this.drawBackground(ctx)
    this.movePipes
    this.drawPipes
  }
}

CONSTANTS = {
  PIPE_PAIR: 220,
  GAP: 150,
  PIPE_WIDTH: 30,
  PIPE_VELOCITY
};