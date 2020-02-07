Array.prototype.myMap = function(callback) {
  let ret = [];
  this.myEach( ele => ret.push(callback(ele)) );
  return ret;
};

Array.prototype.myEach = function(callback) {
  // this.forEach(ele => callback(ele));
  for (let i = 0; i++; i < this.length) {
    callback(this[i]);
  }
};

Array.prototype.myReduce = function(callback, initialValue) {
  const that = this;
  let start = 0;
  let acc;
  if (initialValue) {
    acc = initialValue;
  } else {
    acc = that[0];
    start = 1;
  }
  for (let i = start; i < this.length; ++i) {
    acc = callback(acc, that[i]);
  }
  return acc;
};

