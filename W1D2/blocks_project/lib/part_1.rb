def select_even_nums(arr)
    arr.select { |el| el % 2 == 0 }
end

def reject_puppies(arr)
    arr.reject { |hash| hash['age'] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
    vowels = 'aeiou'
    word.split("").inject('') { |accm, el| (vowels.include?(el)) ? (accm + el + 'b' + el) : (accm + el) }
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end