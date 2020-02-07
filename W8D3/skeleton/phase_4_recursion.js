Array.prototype.range = function(start, end) {
  if (end == start) {
    return [this[start]]
  }
  // if (end < this.length) {
  //   this.pop
  //   this.range(start, end)
  // }
  return [this[start]] + this.range(start+ 1, end)
  // this.slice(start, end)
}


sumRec = function(arr) {
  if (arr.length == 1) {
    return arr[0]
  }

  arr[1] = arr[0] + arr[1]
  arr.shift()
  return sumRec(arr)

}

