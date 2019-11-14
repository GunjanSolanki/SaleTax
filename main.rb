require "./order.rb"
require "./input.rb"
include Input

output = Order.new

puts "Welcome to E-bay!\n"
puts "Enter number of orders : \n"
orders = get_input

puts "------------------------------Order-Receipt---------------------------------------"
orders.each do |order|
  output.print_product_details(order)
end

puts "----------------------------------------------------------------------------------"
