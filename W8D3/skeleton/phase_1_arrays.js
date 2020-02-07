Array.prototype.uniq = function() {
  let ret = [];
  this.forEach( ele => {
    if (!ret.includes(ele)) {
      ret.push(ele);
    }
  });
  return ret;
};

Array.prototype.twoSum = function() {
  let ret = [];
  const that = this;
  Array.from(that.keys()).forEach( idx1 => {
    Array.from(that.keys()).forEach( idx2 =>{
      if ((that[idx1] + that[idx2] === 0) && (idx1 < idx2)) {
        ret.push([idx1, idx2]);
      }
    });
  });
  return ret;
};


Array.prototype.transpose = function() {
  let ret = [];
  const that = this;
  this[0].forEach( el => {
    ret.push(new Array(that.length));
  });
  Array.from(that.keys()).forEach(idx1 => {
    Array.from(that[0].keys()).forEach(idx2 => {
      ret[idx2][idx1] = that[idx1][idx2];
      // console.log(that[idx1][idx2]);
    });
  });
  return ret;
};

