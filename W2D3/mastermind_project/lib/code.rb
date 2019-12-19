class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  attr_reader :pegs


  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else  
      raise "invalid pegs"
    end
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(pegs_string)
    Code.new(pegs_string.split(''))
  end

  def [](idx)
    self.pegs[idx]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    self.pegs.each_with_index do |char, idx|
      count += 1 if char == guess.pegs[idx]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |char, idx|
      count += 1 if self.pegs.include?(char) && char != self.pegs[idx]
    end
    count
  end

  def ==(another_code)
    self.pegs == another_code.pegs
  end




end
