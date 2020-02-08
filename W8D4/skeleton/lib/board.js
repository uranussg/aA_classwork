let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for (let i = 0; i < 8; i++) {
    grid[i] = new Array(8)
  }
  return grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
  // 3,3 |3,4|4,3|4,4
  this.grid[3][4] = new Piece("black");
  this.grid[4][4] = new Piece("white");
  this.grid[3][3] = new Piece("white");
  this.grid[4][3] = new Piece("black");
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]] 
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return !(this.validMoves(color).length === 0)
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  // debug`ger
  if (!this.getPiece(pos)) {
    return false;
  }
  return this.getPiece(pos).color === color
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos)
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black")
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if ((pos[0] < 0) || (pos[0] > 7) || (pos[1] < 0) || (pos[1] > 7))
  {return false}
  return true
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
// function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
//   let toFlip = [];
//   let flag = 0;
//   // let that = this
//   loop1: for(let i = pos[0]; ;) {
//     loop2: for(let j = pos[1]; ;) {

//       j += dir[1]
//       i += dir[0]
  
//       if (!board.isValidPos([i, j]) || !board.isOccupied([i,j])) {
        
//         break loop1;
//       }
//       else if (!board.isMine([i,j], color)) {
        
//         toFlip.push(board.getPiece([i,j]));
//         flag = 1;
//       }
//       else if ( (flag == 1) && (board.isMine([i,j], color))) {
        
//         flag = 2;
//         break loop1;
//       }
//     }


//     } 
//     if (flag === 2) {
//       // 
//       // console.log(piecesToFlip.concat(toFlip) )
//       // piecesToFlip = piecesToFlip.concat(toFlip)
//       return piecesToFlip.concat(toFlip) 
//       // return piecesToFlip
//     }
//     else {
//       // debugger
//       return null
//     }
// }
function _positionsToFlip(board, pos, color, dir, piecesToFlip) {
  debugger
  let newPos = [pos[0] + dir[0], pos[1] + dir[1]]
  if (!board.isOccupied(newPos) || !board.isValidPos(newPos)) {
    debugger
    return null;
  }
  else if (board.isMine(newPos, color) && piecesToFlip.length === 0) { 
    debugger
    return null;
  }
  else if (board.isMine(newPos, color) && !(piecesToFlip.length === 0)){
    debugger
    return piecesToFlip;
  }
  else {
    debugger
    //  piecesToFlip.push(board.getPiece(newPos))
    //  let nPos = newPos
    return _positionsToFlip(board, newPos, color, dir, piecesToFlip.concat([board.getPiece(newPos)]))
  }

}
/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color))  
    {throw new Error("Invalid Move")};

  this.grid[pos[0]][pos[1]] = new Piece(color);
  let that = this
  let piecesToFlip = []
  Board.DIRS.forEach(dir => {debugger
    piecesToFlip = _positionsToFlip(that, pos, color, dir, piecesToFlip) || piecesToFlip
    // _positionsToFlip(that, pos, color, dir, piecesToFlip)
  })

  piecesToFlip.forEach(  piece => { 
    debugger
    piece.flip()})

  

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
   for (let i=0; i<8; i++) {
     let newString = ""
     for (let j = 0; j<8; j++){
      if (!this.getPiece([i,j])) {
        newString += "◻️"
      }
      else {
        newString += this.getPiece([i,j]).toString()
      }
    }

    

    console.log(newString )
  }
  

};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false
  }
  else {let that = this
    let piecesToFlip = []
    Board.DIRS.forEach(dir => {
      debugger
      piecesToFlip = _positionsToFlip(that, pos, color, dir, piecesToFlip) || piecesToFlip
      // _positionsToFlip(that, pos, color, dir, piecesToFlip)
     
    })


    return piecesToFlip.length > 0
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  // let that = this
  // let piecesToFlip = []
  // Board.DIRS.forEach(dir => {
  //   _positionsToFlip(that, pos, color, dir, piecesToFlip)
  // })

  // return piecesToFlip
  let validMoves = []
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j< 8; j++) {
      if (this.validMove([i,j],color)) {
        validMoves.push([i,j])
        // debugger
      }
    }
  }

  return validMoves
};

module.exports = Board;

b = new Board()
// // b.isMine()
b.validMove([2, 3], "white")

