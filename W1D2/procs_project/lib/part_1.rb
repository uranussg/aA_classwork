def my_map(arr, &proc)
    new_arr = []
    arr.each { |el| new_arr << proc.call(el) }
    new_arr
end

def my_select(arr, &proc)
    new_arr = []
    arr.each do |el| 
        if proc.call(el) 
            new_arr << el
        end
    end
    new_arr
end

def my_count(arr, &proc)
    count = 0
    arr.each do |el|
        if proc.call(el)
            count += 1
        end
    end
    count
end

def my_any?(arr, &proc)
    arr.each do |el|
        if proc.call(el)
            return true
        end
    end
    return false
end

def my_all?(arr, &proc)
    arr.each do |el|
        if !proc.call(el)
            return false
        end
    end
    return true
end

def my_none?(arr, &proc)
    arr.each do |el|
        if proc.call(el)
            return false
        end
    end
    return true
end