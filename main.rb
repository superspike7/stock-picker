def stock_picker (arr)
    # pair a possible combination for each array
    combined_arr = arr.combination(2).to_a
    
    # select only the good deal buy price is less than sell
    good_deal_arr = combined_arr.select {|arr| arr.reduce {|buy, sell| buy < sell}}
    
    # pick out the highest profit possible
    best_price = good_deal_arr.map {|arr| arr.reduce {|sell, buy| buy - sell}}.max
    
    # pick the best buy and sell combination
    best_stock = good_deal_arr.select {|arr| arr.reduce {|sell, buy| buy - sell} == best_price}.flatten
  
    day_to_buy = best_stock[0]
    day_to_sell = best_stock[1]
    
    buy = arr.find_index(day_to_buy)
    sell = arr.find_index(day_to_sell)
  
    stock_picked = []
    stock_picked << buy
    stock_picked << sell
    p stock_picked
  end
  
  stock_picker([17,3,6,9,15,8,6,1,10])