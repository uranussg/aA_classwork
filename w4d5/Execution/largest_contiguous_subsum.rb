def largest_contiguous_subsum_1(list) #time complexity = O(n^2)
  sub_arrs = []
  list.each_with_index do |ele1, idx1|
    list.each_with_index do |ele2, idx2|
      sub_arrs << list[idx1..idx2] if idx1 <= idx2
    end
  end
  max = sub_arrs[0].sum
  sub_arrs.each do |sub|
    max = sub.sum > max ? sub.sum : max
  end
  max
end

def largest_contiguous_subsum_2(list)  # time complexity O(n) and space O(1)
 return list.max if list.all?{|ele| ele < 0}

  start, ending = 0, 0
  max_sum = list.first
  current_sum = 0
  while ending < list.length 
    current_sum += list[ending]
    max_sum = current_sum > max_sum ? current_sum : max_sum
    if current_sum < 0 
      start = ending + 1
      current_sum = 0
    end
    ending += 1
  end
  max_sum
end

    list = [-5, -1, -3]
  p  largest_contiguous_subsum_2(list) 