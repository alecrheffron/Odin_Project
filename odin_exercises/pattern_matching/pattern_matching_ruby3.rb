# Rightward assignment
  # Usually variables are placed on the left of an expression that binds the
  # value to that variable. With rightward assignment you deconstruct an object
  # and assign values to variables on the right of the expression, using '=>'
  # instead of '='

# Create normal hash
login = { username: 'hornby', password: 'iliketrains' }

# Assign 'username' to the username symbols value from the hash 'login'
login => { username: username }

# Call username variable
puts "Logged in with username #{username}"
# Returns 'Logged in with username hornby'

# 'Find' pattern
case [1, 2, 3, 4, 5]
in *pre, 2, 3, *post
  p pre
  p post
end

case [1, 2, 'a', 3, 'b', 'c', 7, 8, 9]
in *pre, String => x, String => z, *post # Matches array where there is two strings
  p pre
  p x
  p z
  p post
end

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = 'Jill'
age = 32
job_title = 'leet coder'
case data
in [*, {  name: ^name,
          age: ^age,
          first_language: first_language,
          job_title: ^job_title }, *]
else
  first_language = nil
end

puts first_language