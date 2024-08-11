#----------------------------------------------------------#
#### MY SOLUTION:
def stock_picker(list)
  buy = []
  sell = []

  list_max = list.max

  (1...list.length).each do |i|
    if list[i] > list[i - 1]
      if list[i - 1] <= list[i - 2] && (buy.empty? || (!buy.empty? && buy[-1][1] > list[i - 1]))
        buy.push([i - 1, list[i - 1]])
      end 

      sell.push([i, list[i]])
    end
  end

  buy_length = buy.length
  results = []

  buy.each_with_index do |item, index|
    results.push(sell[-buy_length + index][1] - item[1])
  end

  if buy == [] && sell == []
    return [0, 0]
  end
  
  buy_position = buy[results.index(results.max)]
  sell_position = sell[-buy_length + results.index(results.max)]
  
  if sell_position[1] == list_max
    return [buy_position[0], list.index(list_max)]
  end

  return [buy_position[0], sell_position[0]]
end
#----------------------------------------------------------#


#----------------------------------------------------------#
### NOT MY SOLUTION (For studying purposes):
# def another_stock_picker(prices)
#   min_price = prices[0]
#   min_index = 0
#   max_profit = 0
#   best_days = [0, 0]

#   prices.each_with_index do |price, day|
#     if price < min_price
#       min_price = price
#       min_index = day
#     elsif price - min_price > max_profit
#       max_profit = price - min_price
#       best_days = [min_index, day]
#     end
#   end

#   best_days
# end
#----------------------------------------------------------#



p "#{stock_picker([17,3,6,9,15,8,6,1,10])} => [1, 4]"
p "#{stock_picker([7, 6, 4, 3, 1])} => [0, 0]"
p "#{stock_picker([1, 2, 3, 4, 5])} => [0, 4]"
p "#{stock_picker([3, 2, 6, 5, 0, 3])} => [1, 2]"
p "#{stock_picker([10, 7, 5, 8, 11, 9])} => [2, 4]"
p "#{stock_picker([1, 2, 1, 2, 1])} => [0, 1]"
p "#{stock_picker([17,3,6,9,15,8,6,1,10])} => [1, 4]"
p "#{stock_picker([])} => [0, 0]"
p "#{stock_picker([5])} => [0, 0]"
p "#{stock_picker([10, 10, 10, 10, 10])} => [0, 0]"
p "#{stock_picker([10, 9, 8, 7, 6])} => [0, 0]"
p "#{stock_picker([1, 2, 3, 4, 5])} => [0, 4]"
p "#{stock_picker([1, 4, 2, 5, 3, 6])} => [0, 5]"
p "#{stock_picker([5, 3, 2, 4])} => [2, 3]"
p "#{stock_picker([3, 2, 6, 5, 0, 3])} => [1, 2]"
p "#{stock_picker([10, 8, 6, 4, 3, 5])} => [4, 5]"
p "#{stock_picker((1..10**6).to_a.reverse)} => [0, 0]"
