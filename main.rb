require "./order.rb"
include Input

output = Order.new

puts "Welcome to E-bay!\n"
puts "Enter number of orders : \n"
orders = get_input

puts "\n------------------------------Order-Receipt---------------------------------------"

order_count = 1
orders.each do |order|
  puts "Order : #{order_count}"
  output.print_product_details(order)
  order_count += 1
end

puts "----------------------------------------------------------------------------------"
