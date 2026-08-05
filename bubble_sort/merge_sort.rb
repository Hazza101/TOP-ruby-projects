require 'pry-byebug'
def merge_sort(list, callback = nil)
  callback = ->(a, b) { a < b } if callback.nil?
  return list if list.length < 2

  midpoint = (list.length / 2) - 1
  
  left = merge_sort(list[..midpoint], callback)
  right = merge_sort(list[midpoint + 1..], callback)
  new = []
  i = 0
  j = 0
  while i < left.length or j < right.length
    if j >= right.length or (i < left.length and callback[left[i], right[j]])
      new.push(left[i])
      i += 1
    else
      new.push(right[j])
      j += 1
    end
  end
  new
end
binding.pry
result = merge_sort([4, 3, 78, 2, 0, 2], ->(a,b) {a > b} )
p result
