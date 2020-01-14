require "byebug"
class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @store = [false] * max 
    @max = max                                                                                                                                                                                                                                                                                                                                       
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num 
      @count += 1
    end
    if count > num_buckets
      resize!
    end
  end

  def remove(num)
    if self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  #private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  
    # num_buckets_odd = num_buckets
    # @store += Array.new(num_buckets_odd) { Array.new }
    # @store(0..num_buckets_odd).each_with_index do |bucket, idx|
    #   bucket.each do |num|
    #     if num % num_buckets != idx
    #       bucket.delet(num)
    #       @store[idx + num_buckets_odd] << num
    #     end
    #   end
    # end
    new_buckets = Array.new(num_buckets * 2) { Array.new }
    # debugger
    # p new_buckets
    @store.flatten.each do |num|
      new_buckets[num % new_buckets.length] << num 
    end
    @store = new_buckets
    # debugger
  end
end
