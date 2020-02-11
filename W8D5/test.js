// // const callback1 = function(callback2) {
// //     console.log(`${this} is the context of callback1` )
// //     callback2()
// // }

// class Test {
//     constructor(name, array) {
//         this.name = name;
//         this.array = array
//     }

//     method1() {
//         console.log(`${this} is the context of method1`)

//         this.innermethod1 = function() {
//             console.log(`${this} is the context of innermethod1`)
//         };
//         this.innermethod1();

//     }

//     method2() {
//         console.log(`${this} is the contex of method2 `)
//         this.callback2 = function(){
//             console.log(`${this} is the context of callback2`)
//         }
//         this.callback1 = function() {
//             console.log(`${this} is the context of callback1` )
//             this.callback2()
//         }

//         // this.callback1(function(){
//         //     console.log(`${this} is the context of callback2`)
//         // })

//         this.callback1()
//     }

//     method3() {
//         this.array.forEach(function() {

//             console.log(`${this} is the context of anonimos function in forEach`)
        
//         });
//     }

// }


// a = new Test('test1', [1, 2, 3])
// // a.method2(function(){
// //         console.log(`${this} is the context of callback2`)
// //     })

// a.method2()


// function times(num, fun) {
//     for (let i = 0; i < num; i++) {
//       fun(); // call is made "function-style"
//     }
//   }
  
//   const cat = {
//     age: 5,
  
//     ageOneYear: function() {
//     //   this.age += 1;
//       console.log(`${this}`)
//     }
//   };
  
//   cat.ageOneYear(); // works
  
//   times(10, cat.ageOneYear); 


// function Test() {
//   this.method1 = function() {
//     console.log(`${this} is the context of method1`)
//     const callback1 = function () {
//       const callback2 = function () {
//     console.log(`${this} is the context of callback2`)
  
//       }
//     console.log(`${this} is the context of callback1`)
//     callback2()
  
//     }
//     callback1()
//   }
// }

// Array.prototype.randomMethod = function(){
//   console.log(`${this} is the context of randomMethod`)
//   const callback1 = function () {
//     const callback3 = function () {
//   console.log(`${this} is the context of callback3`)

//     }
//   console.log(`${this} is the context of callback1`)
//   callback3()

//   }
//   callback1()

// }


// Clock.prototype._tick = function() {
//   // 1. Increment the time by one second.
//   console.log(`${this} is the context of _tick`)
//   // this._incrementSeconds();

//   // 2. Call printTime.
//   // this.printTime();
// }

// const clock = new Clock();
// const a = new Test()
// a.method1()
// setTimeout(clock._tick, 1000);

// [1,2,3].randomMethod()

class Test {
  constructor(){
    this.ele = 4
    this.arr = [1, 2, 3]
  }

  move() {
    this.arr.push(this.ele)
  }
}

ts = new Test()
console.log(ts.move())