#Returning first repeated word in a sentence string
# "cat dog cat dog" --> "cat"

def first_repeated_word(str)

  return nil if str == nil || str.length == 0 || str.length == 1

  str = str.downcase

  i = 0
  j = 0

  seen = []

  while j < str.length
    if str[j] == " "
      if seen.include?(str[i...j])
        return str[i...j]
      else
        seen << str[i...j]
        i = j + 1
        j += 2
      end
    else
      j +=1
    end
  end

  puts seen

  return "No repeated words"
end

str1 = "cat dog cat dog"
str2 = "hello there"

first_repeated_word(str3)
