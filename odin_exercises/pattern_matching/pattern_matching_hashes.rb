# Hash pattern matching
# Will only work for 'symbol' keys and not strings
# Unlike arrays you can match against parts of a hash without having to address
  # the fact that there may be additional key-value pairs

case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end

# Match against a hash and assign values to variables
case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a, b
end

# Can be done without providing direct names for variables
case { a: 'apple', b: 'banana' }
in { a:, b: }
  puts b, a
end

# Also as with arrays the brackets can be eliminated
case { a: 'apple', b: 'banana' }
in a:, b:
  puts a, b
end

# Can use dobule splat to scoop up multiple key-value pairs
case { a: 'ant', b: 'ball', c: 'cat' }
in a: 'ant', **rest
  puts rest
end

# Hashes will match only a subset of keys matching, you need to guard against
  # situations where you don't want that behavior
case { a: 'ant', b: 'ball' }
in a: 'ant'
  puts 'this will match'
in a: 'ant', b: 'ball'
  puts 'this will never be reached'
end

# Can use 'double splat nil' to ensure only match exactly
case { a: 'ant', b: 'ball' }
in a: 'ant', **nil
  puts :no_match
in a: 'ant', b: 'ball'
  puts :match
end

# Can use the 'as' pattern to assing the entire hash match to a variable
case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash
  puts hash
end