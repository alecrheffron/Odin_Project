def stock_picker(list)
  max_profit = 0
  for i in 0..list.length
    for j in (i+1)...list.length
      profit = list[j] - list[i]
      if profit > max_profit
        max_profit = profit
        results = [i, j]
      end
    end
  end
  puts "Buy on day #{results[0]} : Sell on day #{results[1]}"
  puts "Profit of $#{max_profit}"
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])