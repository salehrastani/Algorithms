# reverse the elements within an array without a loop

def recursive_reversal(array)

  return array if array == []
  last_element = array.pop
  return ([last_element] << recursive_reversal(array)).flatten

end


recursive_reversal([:hi, "high", 3])