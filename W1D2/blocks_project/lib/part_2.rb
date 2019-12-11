def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
    ends = ['com', 'net', 'io', 'org']

    arr.none? { | url| ends.include?(url.split(".")[-1]) }

end

def any_passing_students?(arr)
    arr.any?{ |hash| hash[:grades].sum / hash[:grades].length >= 75 }
end