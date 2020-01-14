class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key.hash] << key.hash 
      @count += 1
    end
    if count > num_buckets
      resize!
    end
  end

  def include?(key)
    self[key.hash].include?(key.hash)
  end

  def remove(key)
    if self[key.hash].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |num|
      new_buckets[num % new_buckets.length] << num 
    end
    @store = new_buckets
  end
end
