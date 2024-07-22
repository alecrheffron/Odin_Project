def blank_seating_chart(rows, seats)
  Array.new(rows) { Array.new(seats) }
end

def add_seat_to_row(chart, row_index, seat_to_add)
  chart[row_index].push(seat_to_add)
end

def add_another_row(chart, row_to_add)
  chart.push << row_to_add
end

def delete_seat_from_row(chart, row_index, seat_index)
  chart[row_index].delete_at(seat_index)
end

def delete_row_from_chart(chart, row_index)
  chart.delete_at(row_index)
end

def count_empty_seats(chart)
  empty_seats = 0
  chart.each do |row|
    row.each do |seat|
      empty_seats += 1 if seat.nil?
    end
  end
  empty_seats
end

seating_chart = blank_seating_chart(4, 4)
add_seat_to_row(seating_chart, 2, nil)
add_another_row(seating_chart, ["Karl", "Marx"])
delete_seat_from_row(seating_chart, 4, 0)
delete_row_from_chart(seating_chart, 2)
puts count_empty_seats(seating_chart)
p seating_chart
