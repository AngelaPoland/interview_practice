#Given a sorted array of positive integers, return a string that shows ranges/individual numbers. [1, 2, 3, 4, 8, 10, 11, 12] --> "1-4,8,10-12".

def ranges(arr)

i = 0
string = ""

  while i < arr.length
    if string.empty?
      string = "#{arr[i]}"
    elsif arr[i+1] != arr[i] + 1
      if arr[i-1] != arr[i]-1
        string << ",#{arr[i+1]}"
        i += 1
      else
        string << "-#{arr[i]},#{arr[i+1]}"
      end
      i += 1
    else
      i += 1
    end
  end
  return string[0...string.length-1]
end

arr = [1,2,3,4,8,10,11,12]

ranges(arr)
