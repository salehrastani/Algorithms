def stock_profit(days, prices)
    total_profit = 0
    max_price = prices.each_with_index.max
    prices[0...days-1].each_with_index do |price, index|
        if index < max_price[1]
            if (max_price[0] - price) > 0
                profit = max_price[0] - price
                total_profit += profit
            end
        else
            new_max_price = prices[index+1...days].each_with_index.max
            max_price = [new_max_price[0], new_max_price[1] + index]
            if (max_price[0] - price) > 0
                profit = max_price[0] - price
                total_profit += profit
            end
        end
    end
    total_profit
end

test_cases = gets.to_i

(0...test_cases).each do |i|
    days = gets.to_i
    prices = gets.split.map {|price| price.to_i}
    puts stock_profit(days, prices)
end
