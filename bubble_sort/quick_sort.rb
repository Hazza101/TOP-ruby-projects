def quick_sort(list, callback = nil)
  callback = ->(a, b) { a > b } if callback.nil?
  if list.length < 2
    return list
  end
  pivot = list[0] 
  left = Array::new
  right = Array::new
  (1...list.length).each do |i|
    if callback[list[i] ,pivot]
      left.push(list[i])
    else
      right.push(list[i])
    end
  end
  left = quick_sort(left, callback)
  right = quick_sort(right, callback)

  left + [pivot] + right


end

result = quick_sort([4, 3, 78, 2, 0, 2], ->(a, b) { a < b })
p result
