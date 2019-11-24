
ITEM_LIST = ["1 book at 12.49", "1 CD at 14.99", "1 chocolate bar at 0.85",
             "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
             "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pill at 9.75",
             "1 imported box of chocolates at 11.25"].freeze

class Cart
  def add_to_cart(no_of_items, cart)
    no_of_items.times do 
      puts "Enter Item description : "
      input_item = gets.chomp
      (ITEM_LIST.include?(input_item)) ? (cart << input_item) : (print "Invalid Item!\n")
    end
    cart
  end
  
end
