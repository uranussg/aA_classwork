# rspec

def hipsterfy(word)
    vowels = "aeiou"
  
    i = word.length - 1
    while i >= 0
      if vowels.include?(word[i])
        return word[0...i] + word[i+1..-1]
      end
  
      i -= 1
    end
  
    word
  end
  

#debug exercise 2


def prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
    num.downto(2) { |factor| return factor if num % factor == 0 && prime?(factor) }
end


def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index { |ele, i| indices[ele] << i }
    indices.select { |ele, indices| indices.length > 1 }
end

def ana_array(arr_1, arr_2)
    count_1 = ele_count(arr_1)
    count_2 = ele_count(arr_2)
    count_1 == count_2
end

# block

def select_even_nums(numbers)
    numbers.select(&:even?)
end

def no_valid_url?(urls)
valid_endings = [".com", ".net", ".io", ".org"]
urls.none? do |url|
    valid_endings.any? { |ending| url.end_with?(ending) }
end
end