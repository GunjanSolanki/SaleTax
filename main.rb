require "./order.rb"
require "./cart.rb"

puts "Welcome to E-bay!\n"
puts "Enter number of orders : \n"
order_count = 0
no_of_orders = gets.chomp.to_i

puts "\n------------------------------Order-Receipt---------------------------------------"

no_of_orders.times do
  puts "Enter details of Order : #{order_count+=1}"
  puts "Enter number of items to order :\n"
  no_of_items = gets.chomp.to_i
  cart = Cart.new
  cart.add_to_cart(no_of_items, items= [])
  puts "Order : #{order_count}"
  order = Order.new(items)
  order.print_receipt
end

