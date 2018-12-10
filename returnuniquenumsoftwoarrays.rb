# Write a function that takes two sorted arrays of nonduplicated integers and then returns an array with all the unique numbers from both arrays: EX: [1,3,4,6] & [2,3] —> [1,2,3,4,6]

def unique_nums(arr1, arr2)

  if arr1.length > arr2.length
    smaller = arr2
    larger = arr1
  else
    smaller = arr1
    larger = arr2
  end

  i = 0
  j = 0

  unique = []

  while j < larger.length && i < smaller.length
    if smaller[i] == larger[j]
      unique << smaller[i]
      i += 1
      j += 1
    elsif smaller[i] > larger[j]
      unique << larger[j]
      j += 1
    elsif smaller[i] < larger[j]
      unique << smaller[i]
      i += 1
    end
  end

  #unique << larger[j..larger.length]
  # larger[j..larger.length].each do |num|
  #   unique << num
  # end

  larger[j..larger.length].map {|num| unique << num}

  return unique

end


arr1 = [1,3,4,6]
arr2 = [2,3]

unique_nums(arr1,arr2)

#BELOW if given arrays contain duplicates
#require 'set'

# def unique_nums(arr1, arr2)

#   unique = Set.new

#   arr1.each do |num|
#     unique << num
#   end

#   arr2.each do |num|
#     unique << num
#   end

#   return unique.to_a.sort

# end
