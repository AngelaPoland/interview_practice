#Given an array of integers and an integer as input return true/false if any of the ints sum to the single int.

def two_sum(arr, target)
  checked = {}

  arr.each do |n|
    return true if checked[target-n]
    checked[n] = target - n
  end

  return false
end


#Given an array of integers and a target integer return THE INDICES of the two integers that add up to the target

def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |n, idx|
    differential = target - n
    return [hash[differential], idx] if hash[differential]
    hash[n] = idx
  end
end
