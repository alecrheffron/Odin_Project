def bubble_sort(list)
  sorted = false
  while !sorted
    sorted = true
    for i in 0...(list.length - 1)
      if list[i] > list[i + 1]
        list[i + 1], list[i] = list[i], list[i + 1]
        sorted = false
      end
    end
  end
  puts list
  return true
end

bubble_sort([6, 2, 4, 5, 3, 1, 8, 7])