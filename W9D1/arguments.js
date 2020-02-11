sum = function(args) {
  let sum = 0
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i]
  }
  return console.log(`${sum}`)
}


sum1 = function(...args) {
  let sum = 0;
  args.forEach(num => sum += num)
  return console.log(`${sum}`)
}
sum(1, 2, 3, 4)

Function.prototype.myBind = function(ctx, ...args1) {
  // let that = this;
  //arguments like args1
  // let arguments1 = [...arguments]
  
  return (...args2) => { 
    //arguments like args1
    // let arguments2 = [...arguments]
    //this.call(ctx, ...args1, ...args2)
    this.apply(ctx, args1.concat(args2))
  }
}


curriedSum = function(len) {
  let sum = 0;
  let length = len;

  return innerSum = function(num) {
    --length;
    
    if (length === 0) {
      sum += num;
      return console.log(`${sum}`);    
    } else {
      sum += num;
      return innerSum;
    }
  }
}

const sum2 = curriedSum(4);
sum2(5)(30)(20)(1); // => 56


Function.prototype.curry = function(numArgs){
  // let length = numArgs
  let store = []
  return collector = (...args) => {
    store = store.concat(args)
    if (store.length >= numArgs) {
      this(...store)
    }
    else {
      return collector
    }


  }
}