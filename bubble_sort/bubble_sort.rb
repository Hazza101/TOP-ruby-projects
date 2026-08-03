def bubble_sort(list, callback = nil)
  callback = ->(a, b) { a > b } if callback.nil?
  sorted = false
  until sorted
    sorted = true
    (0...list.length - 1).each do |i|
      first = list[i]
      second = list[i + 1]
      next unless callback[first, second]

      list[i], list[i + 1] = list[i + 1], list[i]
      sorted = false
    end
  end
  list
end

result = bubble_sort([4, 3, 78, 2, 0, 2], ->(a, b) { a < b })
p result
