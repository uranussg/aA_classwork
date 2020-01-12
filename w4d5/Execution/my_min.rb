def my_min_1(list)   # time comlpexity = O(n^2)
  list.each do |ele1|
    return ele1 if list.all? { |ele2| ele1 <= ele2 }
  end
end     

list = [0, 3, 5, 4, -5, 10, 1, 90]

p my_min_1(list)    

def my_min_2(list)  # time complexity = O(n)
  min = list[0]
  list.each do |ele|
    min = min > ele ? ele : min
  end
  min
end

p my_min_2(list)