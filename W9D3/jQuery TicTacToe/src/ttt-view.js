class View {
  constructor(game, $el) {
    this.game = game
    this.$el = $el
    this.setupBoard();
    this.name = "i AM THE VIEW"
  }

  bindEvents() {
    let $li = $("li")
    let that = this
    let game = this.game
    // console.log(`${that.name}`)

    $li.on("click", function(){
      // console.log(`${that}`)

      let id = $(event.target).val()
      let pos = [Math.floor(id / 3), id % 3]
      // console.log(`${pos}`)
      let sign = game.currentPlayer
      // console.log(`${sign}`)

      $(event.target).html(sign)
      $(event.target).addClass(sign)
      game.playMove(pos)
      console.log(`${game.winner()}`)
      if (game.winner()) {
        // let winner = document.getElementsByClassName(game.winner)
        // let $winner = $(winner)
        // console.log(`${$winner.__proto__}`)
        // $.each($winner, (i, ele) => {
        //   console.log(`${ele.__proto__}`)
        //   $(ele).addClass("winner")
        // });
        that.$el.addClass("game-over")
        that.$el.addClass(game.winner());

        let winnerMessage = $("<p>").html(`You win, ${game.winner()}!`);
        that.$el.append(winnerMessage);


        // let loser = game.winner() === "x" ? "o" : "x";
  
        // let $loser = $(loser)
        // $.each($loser, (ele) => {
        //   $(ele).addClass("loser")
        // });
  
      }

    })

  }

  makeMove($square) {}

  setupBoard() {

    
    let $ul = $("<ul>");
    this.$el.append($ul);

    for (let i = 0; i < 9; i++) {
      let $li = $("<li>");
      $li.val(i)
      $ul.append($li);
    }
  }
}

// pos = [id/3, id % 3]



module.exports = View;
