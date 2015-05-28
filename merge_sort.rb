array = [6,5,3,1,8,7,2,4]

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid_point = (array/2).floor
    left = mergesort(array[0...mid_point])
    right = merge_sort(array[midpoint..-1])
    merge(left, right)
  end
end

def merge(left, right)

end


merge_sort(array)