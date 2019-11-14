module Input
  ITEM_LIST = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85",
               "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
               "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pills at 9.75", "1 imported box of chocolates at 11.25"]

  def get_input
    orders = []
    no_of_orders = gets.chomp.to_i
    no_of_orders.times {
      input_list = []
      puts "Enter number of items to order :\n"
      get_item(input_list)
      orders << input_list
    }
    orders
  end

  def get_item(input_list)
    no_of_items = gets.chomp.to_i
    no_of_items.times {
      puts "Enter Item description : "
      input_item = gets.chomp
      (ITEM_LIST.include?(input_item)) ? (input_list << input_item) : (print "Invalid Item!\n")
    }
  end
end
