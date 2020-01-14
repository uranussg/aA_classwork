class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.to_s.hash
  end
end

class String
  def hash
    acc = 0
    self.split("").each_with_index do |char, idx|
      acc += (char.ord ^ idx)
    end
    acc.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
