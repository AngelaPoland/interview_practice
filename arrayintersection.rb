#Given 2 sorted arrays with no repeating integers, return the integers that are common to both arrays

#Array Solution:

def find_intersection(arr1, arr2)
  return [] if arr1 == nil || arr2 == nil

  if arr1.length > arr2.length
    smaller = arr2
    larger = arr1
  else
    smaller = arr1
    larger = arr2
  end

  intersection = []
  i = 0
  j = 0

  while i < smaller.length
    if smaller[i] == larger[j]
      intersection << smaller[i]
      i += 1
      j += 1
    elsif smaller[i] > larger[j]
      j += 1
    else
      i += 1
    end
  end

  return intersection
end



#Hash Solution

def find_intersection(arr1, arr2)
  return [] if arr1 == nil || arr2 == nil

  if arr1.length > arr2.length
    smaller = arr2
    larger = arr1
  else
    smaller = arr1
    larger = arr2
  end

  intersection_hash = {}

  smaller.each do |num|
    intersection_hash[num] = 1
  end

  common_elements = []

  larger.each do |num|
    if intersection_hash.include?(num)
      common_elements << num
    end
  end

  return common_elements

end

####################
array1 = [2,6,7,8,9,10]
array2 = [3,5,6,9,11,12]

find_intersection(array1, array2)
