def partition(array, start, e, callback = nil)
  callback = ->(a, b) { a >= b } if callback.nil?
  pivot = array[start]
  low = start + 1
  high = e
  while true
    high -= 1 while low <= high and callback[array[high], pivot]
    low += 1 while low <= high and callback[pivot, array[low]]

    break unless low <= high

    array[low], array[high] = array[high], array[low]

  end
  array[start], array[high] = array[high], array[start]
  high
end

def quick_sort(array, s, e)
  return if s >= e

  p = partition(array, s, e)
  quick_sort(array, s, p)
  quick_sort(array, p + 1, e)
end

array = [4, 3, 78, 2, 0, 2]
quick_sort(array, 0, 5)
p array
