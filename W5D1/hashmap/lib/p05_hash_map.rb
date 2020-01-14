require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key) 
  end

  def set(key, val)
    flag = false
    if !include?(key)
      bucket(key).append(key, val) 
      @count += 1
      flag = true
    end
    if count > num_buckets
      resize!
    end
    flag
  end

  # def get(key)

  # end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  # alias_method :[], :get
  # alias_method :[]=, :set

  def [](key)
    bucket(key).get(key)
  end

  def []=(key, value)
    unless bucket(key).update(key, value)
      set(key, value)
    end
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(num_buckets * 2) { LinkedList.new }
    self.each do |key, val|
      new_buckets[key.hash % new_buckets.length].append(key, val)
    end
    @store = new_buckets
  end

  def bucket(key)      
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end


m = HashMap.new

p m.set(:first, 1)
p m.set(:second, 2)
p m.set(:third, 3)
p m.set(:forth, 4)
# p m.first.val
# p m.first.next.val
# p m.first.next.next.val
# p m.first.next.next.next.val
# p m.first.next.next.next.next.val

m.each { |k, v| p [k, v] }

# m.remove(:second)
# p l.first.val
# p l.first.next.val
# p l.first.next.next.val
# p l.first.next.next.next.val
# #p l.first.next.next.next.next.val