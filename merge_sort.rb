array = [6,5,3,1,8,7,2,4]

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid_point = (array.length/2).floor
    left = merge_sort(array[0...mid_point])
    right = merge_sort(array[mid_point..-1])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left[0] > right[0]
    [right[0]] + merge(right[1..-1], left)
  else
    [left[0]] + merge(left[1..-1], right)
  end
end


p merge_sort(array)