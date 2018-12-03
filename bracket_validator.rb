# You're working with an intern that keeps coming to you with JavaScript code that won't run because the braces, brackets, and parentheses are off. To save you both some time, you decide to write a braces/brackets/parentheses validator.

# Let's say:

# '(', '{', '[' are called "openers."
# ')', '}', ']' are called "closers."
# Write an efficient method that tells us whether or not an input string's openers and closers are properly nested.

# Examples:

# "{ [ ] ( ) }" should return true
# "{ [ ( ] ) }" should return false
# "{ [ }" should return false

# Simply making sure each opener has a corresponding closer is not enough—we must also confirm that they are correctly ordered.

require 'set'

def valid?(code_string)
  openers_to_closers = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  openers = openers_to_closers.keys.to_set
  closers = openers_to_closers.values.to_set

  openers_stack = []

  code_string.chars.each do |char|
    if openers.include? char
      openers_stack.push(char)
    elsif closers.include? char
      if openers_stack.empty?
        return false
      else
        last_unclosed_opener = openers_stack.pop

        # if this closer doesn't correspond to the most recently
        # seen unclosed opener, short-circuit, returning false
        if openers_to_closers[last_unclosed_opener] != char
          return false
        end
      end
    end
  end
  return openers_stack.empty?
end

valid?("{{[(a(f[d(])bc)]}}")

# O(n) time (one iteration through the string), and O(n)O(n) space (in the worst case, all of our characters are openers, so we push them all onto the stack).
