require "byebug"

def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each {|el| counts[el] += 1}
    counts.select {|k,v| v == 1}.keys
end

def no_consecutive_repeats?(arr)
    arr.each_with_index do |el, i|
        return false if el == arr[i+1]
    end
    true
end

def char_indices(str)
    indices = Hash.new{|h,k| h[k] = []}
    str.each_char.with_index do |char, i|
        indices[char] << i
    end
    indices
end

def longest_streak(str)
    longest = ""
    current = ""
    str.each_char.with_index do |char, i|
        if current.include?(char)
            current += char
        else 
            current = char
        end
        longest = longest.length > current.length ? longest : current
    end
    longest


    #str.gsub(/(\w)(\1)+/).max { |a, b| a.length <=> b.length } 
end

def bi_prime?(num) 
    primes = list_of_primes(num)
    primes.any? { |p| num % p == 0 && primes.include?(num/p) }
end

def list_of_primes(num)
    lists = [2]
    i = 3
    while i < num
        lists << i if lists.none? { |ele| i % ele == 0 }
        i += 1
    end
    lists 
end

def transform(char, num)
    alphabet = ("a".."z").to_a
    idx = (alphabet.index(char) + num)  % 26
    alphabet[idx]
end

def vigenere_cipher(message,keys)
    message.chars.map.with_index {|char, i| transform(char, keys[i%keys.length])}.join
end

def vowel_rotate(str)
    vowels = str.chars.select {|c| 'aeiou'.include?(c) }
    t = vowels.pop
    vowels.unshift(t)
    str.each_char.with_index do |char, i|
        if 'aeiou'.include?(char)
            str[i] = vowels.shift
        end
    end
    str
end


class String
    def select(&prc)
        return '' if !prc
        new_str = ''
        self.each_char do |c|
            new_str += c if prc.call(c)
        end
        new_str


    end


    def map!(&prc)
        self.each_char.with_index do |c, i|
            self[i] = prc.call(c, i)
        end
    end
end
