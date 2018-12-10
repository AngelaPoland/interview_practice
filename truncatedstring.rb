# Given a string and a number input, return truncated string that has that number of elements. Caveat, if the string would be split in the middle of a word, return string truncated at the last whole word. For example, ("hello world", 8) would return just "hello" and not "hello wo".

def truncated_string(str, num)

  if str.include?(" ")
    last_index = str.index(" ")
    if num > last_index
      return str[0..last_index-1]
    else
      return str[0..num]
    end
  else
    return str[0..num]
  end

end

str1 = "hello world"
str2 = "helloworld"

truncated_string(str1, 7)
