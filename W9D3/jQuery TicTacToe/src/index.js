const View = require("./ttt-view.js")
const Game = require("./game.js")

  $(() => {
    let newGame = new Game()
    let $figure = $(".ttt");
    let newView = new View(newGame, $figure)
    window.newView = newView;
    let $li = $("li")
    $li.on("mouseenter", (e) => {
      $(e.target).addClass("hovered") 
      // $(e.target).css("background-color", "yellow")
    })

    $li.on("mouseleave", (e) => {
      $(e.target).removeClass("hovered") 
      // $(e.target).css("background-color", "gray")
    })
    newView.bindEvents()
  });




