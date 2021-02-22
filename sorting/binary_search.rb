# Searches for the item inside a sorted (Ascening) array.
# Returns the index of the element if the element not found it raises an error
def binary_search(array, item)
  puts "Searching for #{item} in #{array}"
  raise ArgumentError, 'Argument is not an array' unless array.is_a? Array
  raise ArgumentError, 'Array must be non-empty' unless array.length() > 0

  low = 0
  high = array.length() - 1
  while low <= high
    mid = ((low + high)/2.0).floor
    if array[mid] > item
      high = mid -1
    elsif array[mid] == item
      return mid
    else
      low = mid + 1
    end
  end

  return -1
end

# gets a list of numbers from the console. It is up to the user to ensure
# that it is sorted
def get_list_from_console()
  puts "Insert list of integers (space separated):"
  nums = gets.chomp
  int_arr = nums.split(" ").map { |num_str| num_str.to_i }
  puts "Search for num: "
  num = gets.chomp.to_i
  return int_arr, num
end

if __FILE__ == $0
  arr, num = get_list_from_console()
  puts "Item at index: #{binary_search(arr, num)}"
end