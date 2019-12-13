def my_reject(arr, &proc)
    new_arr = []
    arr.each { |el| new_arr << el if !proc.call(el) }
    new_arr
end

def my_one?(arr, &proc)
    count = 0
    arr.each { |el| count += 1 if proc.call(el) }
    count == 1
end

def hash_select(h, &proc)
    new_h = Hash.new 
    h.each do |k, v|
        new_h[k] = v if proc.call(k, v)
    end
    new_h
end

def xor_select(arr, proc1, proc2)
    arr.select do |el|
        (proc1.call(el) || proc2.call(el)) &&  !(proc1.call(el) && proc2.call(el))
    end
end

def proc_count(v, arr)
    arr.count { |proc| proc.call(v) }
end

