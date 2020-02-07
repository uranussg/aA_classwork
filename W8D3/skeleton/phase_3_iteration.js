Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; ++i) {
      if (this[i] > this[i+1]) {
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this; 
};

String.prototype.substrings = function() {
  let substrings = [];
  let that = this;
  for (let i = 0; i < this.length - 1; ++i) {
    for (let j = i+1; j < this.length; ++j) {
      if (!substrings.includes(that.slice(i, j))) {
        substrings.push(that.slice(i,j));
      }
    }
  }
  return substrings;
};