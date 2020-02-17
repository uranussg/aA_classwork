
const Board = require("./board");
class Game {
  constructor() {
    this.board = new Board();
    this.currentPlayer = Board.marks[0];
  }

  playMove(pos) {
    this.board.placeMark(pos, this.currentPlayer);
    this.swapTurn();
  }

  winner() {
    return this.board.winner();
  }
  swapTurn() {
    if (this.currentPlayer === Board.marks[0]) {
      this.currentPlayer = Board.marks[1];
    } else {
      this.currentPlayer = Board.marks[0];
    }
  }
}

module.exports = Game;