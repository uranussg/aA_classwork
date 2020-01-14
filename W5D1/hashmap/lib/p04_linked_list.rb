class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev.next = @next if prev 
    @next.prev = prev if @next
    
    prev = nil
    @next = nil 
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end



  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return true
        
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        break
      end
    end
  end

  def each(&prc)
    current = @head.next
      until current.next.nil?
        prc.call(current)
        current = current.next
      end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end


# l = LinkedList.new 
# p l.first
# p l.last
# p l.append(:first, 1)
# p l.append(:second, 2)
# p l.append(:third, 3)
# p l.append(:forth, 4)
# p l.first.val
# p l.first.next.val
# p l.first.next.next.val
# p l.first.next.next.next.val
# p l.first.next.next.next.next.val

# l.each { |node| p node.key }

# l.remove(:second)
# p l.first.val
# p l.first.next.val
# p l.first.next.next.val
# p l.first.next.next.next.val
# #p l.first.next.next.next.next.val