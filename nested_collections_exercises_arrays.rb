# Nested Arrays

def blank_seating_chart(number_of_rows, seats_per_row)
  Array.new(number_of_rows) { Array.new(seats_per_row)}
end

seating_chart = blank_seating_chart(1, 3)

def add_seat_to_row(chart, row_index, seat_to_add)
  chart[row_index].push(seat_to_add)
end

add_seat_to_row(seating_chart, 0, "steve")

def add_another_row(chart, row_to_add)
  chart << row_to_add
end

add_another_row(seating_chart, [nil, nil, nil])

def delete_seat_from_row(chart, row_index, seat_index)
  chart[row_index].delete_at(seat_index)
end

delete_seat_from_row(seating_chart, 0, 3)

def delete_row_from_chart(chart, row_index)
  chart.delete_at(row_index)
end

delete_row_from_chart(seating_chart, 1)

def count_empty_seats(chart)
  all_seats = chart.flatten
  all_seats.count(nil)
end

empty_seats = count_empty_seats(seating_chart)
puts empty_seats

puts seating_chart.inspect

def find_favorite(array_of_hash_objects)
  array_of_hash_objects.find { |hash| hash[:is_my_favorite] == true }
end

hash_objects = [
  {name: 'Ruby', is_my_favorite: true},
  {name: 'Javascript', is_my_favorite: false},
  {name: 'HTML', is_my_favorite: false}
]
favorite = find_favorite(hash_objects)
puts favorite.inspect