require "./order.rb"
require "./input.rb"

order = Order.new

puts "Welcome to E-bay!\n"
puts "Enter number of orders : \n"
inputs = Input.get_order_input

puts "\n------------------------------Order-Receipt---------------------------------------"

order_count = 1
inputs.each do |input|
  puts "Order : #{order_count}"
  order.print_receipt(input)
  order_count += 1
end

puts "----------------------------------------------------------------------------------"
