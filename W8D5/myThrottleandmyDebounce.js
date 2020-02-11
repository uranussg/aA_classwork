Function.prototype.myThrottle = function(interval) {
    let tooSoon = false
    let that = this
    return function() {
        if (!tooSoon) {
            that()
            tooSoon = true
            setTimeout(() => tooSoon = false, interval)
            // this.myThrottle()
        }
    }
}



// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// }
// const neuron = new Neuron();

//   const interval = setInterval(() => {
//     neuron.fire();
//   }, 10);

  

Function.prototype.myDebounce = function(interval) {
    // let timeUp = false
    let timeout
    // let that = this
    return () => {

        clearTimeout(timeout)
        // timeUp = false
        // const tsCall = () => {
            // timeout = null
            // timeUp = true
            // this()
            
        // }
        timeout = setTimeout(() => {
            // timeUp = true
                this()

        }, interval)
        // timeout = setTimeout(tsCall, interval)
    }
}

// Function.prototype.myDebounce = function(interval) {
//     // declare a variable outside of the returned function
//     let timeout;
//     // return a function that takes an arbitrary number of arguments
//     return (...args) => {
//       // declare a function that sets timeout to null and invokes this with args
//       const fnCall = () => {
//         timeout = null;
//         this(...args);
//       }
//       // each time this function is called, it will clear the previous timeout
//       // and create a new one that invokes fnCall after the interval has passed
//       // since the timeout is reset every time the function is invoked, 
//       // fnCall will only be called once the interval has passed without any new 
//       // invocations
//       clearTimeout(timeout);
//       timeout = setTimeout(fnCall, interval);
//     }
// }


class SearchBar {
    constructor() {
      this.query = "";
  
      this.type = this.type.bind(this);
      this.search = this.search.bind(this);
    }
  
    type(letter) {
      this.query += letter;
      this.search();
    }
  
    search() {
      console.log(`searching for ${this.query}`);
    }
  }


  const searchBar = new SearchBar();

  
  // queryForHelloWorld();
  
  const queryForHelloWorld = () => {
    searchBar.type("h");
    searchBar.type("e");
    searchBar.type("l");
    searchBar.type("l");
    searchBar.type("o");
    searchBar.type(" ");
    searchBar.type("w");
    searchBar.type("o");
    searchBar.type("r");
    searchBar.type("l");
    searchBar.type("d");
};

searchBar.search = searchBar.search.myDebounce(5000);

queryForHelloWorld()
// const query2ForHelloWorld = () => {
//   mySearchBar("h");
//   mySearchBar("e");
//   mySearchBar("l");
//   mySearchBar("l");
//   mySearchBar("o");
//   mySearchBar(" ");
//   mySearchBar("w");
//   mySearchBar("o");
//   mySearchBar("r");
//   mySearchBar("l");
//   mySearchBar("d");
// };
// query2ForHelloWorld();