# Recusive implementation of merge sort.
def merge_sort(arr)
  raise ArgumentError, 'Argument is not an array' unless arr.is_a? Array

  if arr.length < 2
    return arr
  end

  middle = arr.length/2
  left = merge_sort(arr[0, middle])
  right = merge_sort(arr[middle..-1])
  merge(left, right)
end

def merge(left, right)
  if right.empty?
    return left
  end

  if left.empty?
    return right
  end

  li = 0
  ri = 0
  out = []

  while li < left.length && ri < right.length
    if left[li] < right[ri]
      out.push(left[li])
      li += 1
    else
      out.push(right[ri])
      ri += 1
    end
  end

  if li != left.length
    out += left[li..-1]
  elsif ri != right.length
    out += right[ri..-1]
  end

  return out
end

if __FILE__ == $0
  arr = [7, 6, 4, 1, 10, 66, 100, -5]
  puts "Before: #{arr}"
  puts "After: #{merge_sort(arr)}"
end