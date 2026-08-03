def bubble_sort(list)
  sorted = false
  until sorted
    sorted = true
    for i in 0...list.length - 1 do
      first = list[i]
      second = list[i + 1]
      next unless first > second

      tmp = list[i]
      list[i] = list[i + 1]
      list[i + 1] = tmp
      sorted = false
    end
  end
  list
end

result = bubble_sort([4, 3, 78, 2, 0, 2])
p result
