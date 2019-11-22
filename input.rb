module Input
  ITEM_LIST = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85",
               "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
               "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pills at 9.75", "1 imported box of chocolates at 11.25"]
  ITEM_LIST.freeze

  def self.get_order_input
    orders = []
    order_count = 0
    no_of_orders = gets.chomp.to_i
    no_of_orders.times {
      order_count+=1
      input_list = []
      puts "\nOrder : #{order_count}"
      puts "Enter number of items to order :\n"
      self.get_item_input(input_list)
      orders << input_list
    }
    orders
  end

  def self.get_item_input(input_list)
    no_of_items = gets.chomp.to_i
    no_of_items.times {
      puts "Enter Item description : "
      input_item = gets.chomp
      (ITEM_LIST.include?(input_item)) ? (input_list << input_item) : (print "Invalid Item!\n")
    }
  end
  
end
