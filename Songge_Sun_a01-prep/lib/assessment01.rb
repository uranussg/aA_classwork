class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    acc = accumulator
    acc = self.shift if acc.nil?
  
    self.each do |ele|
      acc = prc.call(acc, ele)
    end
    acc
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).none? { |ele| num % ele == 0 }
end

def primes(num)
  arr = []
  i = 2
  while arr.length < num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  pre = factorials_rec(num - 1)
  pre + [pre.last * (num - 1)]
end


class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_hash = Hash.new { |h, ele| h[ele] = [] }
    self.each_with_index do |ele, idx|
      dup_hash[ele] << idx
    end
    dup_hash.select { |k, v| v.length > 1 }

  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    arr = []
    (0...self.length).each do |start|
      (start + 1..self.length).each do |ending|
        pairs = (ending - start + 1) / 2
        arr << self[start..ending] if (0...pairs).all? { |p| self[start + p] == self[ending - p] }
      end
    end
    arr
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length < 2

    middle = self.length/2
    left = self[0...middle]
    right = self[middle..-1]
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc) 
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    while !left.empty? && !right.empty?
      #print prc.call(left.first, right.first)
      if prc.call(left.first, right.first) == 1
        arr << right.shift
      else  
        arr << left.shift
      end

    end
    arr + left + right
  end
end


# r= [2, 5, 3, 4].merge_sort do |num1, num2|
#   # reverse order
#   num2 <=> num1
# end

# p r