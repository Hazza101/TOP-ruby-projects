def selection_sort(list, callback = nil)
  callback = ->(a, b) { a < b } if callback.nil?
  (0...list.length).each do |i|
    minimum_index = (i...list.length).reduce do |minimum, index|
      if callback[list[index], list[minimum]]
        index
      else
        minimum
      end
    end
    list[minimum_index], list[i] = list[i], list[minimum_index]
  end
  list
end

result = selection_sort([4, 3, 78, 2, 0, 2])
p result
