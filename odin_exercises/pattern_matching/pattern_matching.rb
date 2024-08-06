coedef letter_grades_to_number(grade)
  case grade
    in 'A' then 4
    in 'B' then 3
    in 'C' then 2
    in 'D' then 1
  else 0
  end
end

steves_grades = ['A', 'B', 'B', 'D', 'C', 'A']

def gpa(grade_array)
  combined_numbers = 0
  number_array = grade_array.map { |grade| letter_grades_to_number(grade) }
  number_array.map { |number| combined_numbers += number }
  combined_numbers.to_f/grade_array.length
end

grades = gpa(steves_grades)
puts grades

# 'Variable Pattern' binds a variable(s) to the values that match the pattern
age = 15
case age
  in a
    puts a
end

# 'Variable Pattern' will reasign a value to the variable
a = 5
puts a
# Return 5

case 1
  in a
  a
end
puts a
# Return 1

# To fix this Ruby provides the pin operator '^' which instead matches against
# a variable of that name
case 1
in ^a
  :no_match
end

# 'As pattern' match -- this will make more sense when we get to array and hash
case 3
in 3 => a
  puts a
end

# 'Alternative pattern' match
b = 1
case b
in 0 | 1 | 2
  puts :match
end

# 'Guard Conditions' -- Way to make sure pattern is only matched if the guard
# condition holds true
some_other_value = true

case 0
in 0 if some_other_value
  puts :match
end

