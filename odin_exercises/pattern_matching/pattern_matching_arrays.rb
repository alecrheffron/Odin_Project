# Array matching
# Most basic, can match against exact elements in array
arr = [3, 4]

case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

# If there are more elements in the array than 2 then this would come back with
# an error, so in order to allow the array to be larger and just match if the
# first two are integers

# Using the 'splat'
arr = [1, 2, 'spleet', 'splat', 'splote', 6, 7]
case arr
in [Integer, Integer, *]
  puts :match
in [String, String, *]
  puts :no_match
end

# Can be combined to test if first two and last two match
case arr
in [Integer, Integer, *, 6, Integer]
  puts :match
end

# To give us the values at the end of an array
case arr
in [1, 2, *tail]
  p tail
end

# If you don't care about particular values use '_'
case arr
in [1, 2, _, _, _, 6, 7]
  puts :match
end

# 'Guard Clause' if you wantch to match against an array of two numbers but
# only if they aren't the same number
arr = [1, 2]
case arr
in [a, b] unless a == b
  puts :match
end

# Nested arrays
arr = [[1, 2], [3, 4]]
case arr
in [[_, _], [3, 4]]
  puts :match
end

# This is real power of pattern matching is, traversing deeply nested structure
arr = [1, 2, 3, 4, 5]
case arr
in [1, 2, 3, a, b]
  puts a
  puts b
end

# You have a nested array and you want to match against both the nested array
# and some individual parts of it

case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  p a, arr
end

# Be wary of variable reassignment
arr = [1, 2, 3]
case [1, 2, 4]
in arr
  :match
end
p arr

# When matching an array the '[]' is optional inside the case statement
case arr
in 1, 2, _
  puts :match
end