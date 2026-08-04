def insertion_sort(arr, callback = nil)
  callback = ->(a, b) { a < b } if callback.nil?
  (1...arr.length).each do |i|
    num = arr[i]
    j = i - 1
    while j >= 0 and callback[num, arr[j]]
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = num
  end
  arr
end

result = insertion_sort([4, 3, 78, 2, 0, 2])
p result
