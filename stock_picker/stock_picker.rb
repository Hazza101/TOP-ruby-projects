def stock_picker(prices)
  buy_day = 0
  best_buy_day = 0
  sell_day = 0
  max_profit = 0
  buy_price = prices[0]

  prices.each_with_index do |price, day|
    current_profit = price - buy_price
    if current_profit > max_profit
      best_buy_day = buy_day
      sell_day = day
      max_profit = current_profit
    end
    if price < buy_price
      buy_day = day
      buy_price = price
    end
  end
  return [best_buy_day, sell_day] if max_profit != 0

  [-1, -1]
end

stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
best_day = stock_picker(stock_prices)
p best_day
