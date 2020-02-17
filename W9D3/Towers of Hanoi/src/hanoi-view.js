class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupTowers();
    this.ivar = [];
  }

  setupTowers() {
    

    for (i= 0; i< 3;i++) {
      let $ul = $("<ul>")
      $ul.val(i)
      this.el.append($ul)
    }

  let $ul1 = $("ul").eq(0)
    for (i=0;i < 3; i++) {
      let $li = $("<li>")
      $li.val(i+1)
      $ul1.append($li)
    }
  }

  render() {

  }

  clickTower() {
    $ul = $("ul");
    $ul.click(function() {
      let idx = event.target.val();
      this.ivar.append(idx);
      if (this.ivar.length === 2) {
        if (this.game.isValidMove(this.ivar[0], this  .ivar[1])) {

        }
      }
    })
  }

}


module.exports = View;