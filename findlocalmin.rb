def find_local_min(arr)

  return nil if arr == nil

  if arr.length == 1
    return 0
  end

  arr.each_with_index do |int, i|
    if (arr[i+1] == nil || arr[i+1] > int) && (arr[i-1] > int || arr[i-1] == nil)
      return i
    end
  end


end


ar1 = [2,1,4] #output should be 1
ar2 = [0,3,9] #output should be 0
ar3 = [9,5,4] #output should be 2

find_local_min(ar3)
