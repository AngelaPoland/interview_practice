#given an integer, return a data structure with the integer distribution

#example:
# input: 1004
# output: {
#   1 => 1,
#   0 => 2,
#   4 => 1
# }

def digit_count(num)
digits = {}
  if num == 0
     return digits = {0 => 1}
  end

  while num > 0
    i = num % 10

    if digits[i]
      digits[i] += 1
    else
      digits[i] = 1
    end
    num = num/10
    end
  return digits
end

digit_count(1104)
