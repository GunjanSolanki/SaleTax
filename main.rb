require "./order.rb"

puts "Welcome to E-bay!\n"
puts "Enter number of orders : \n"
no_of_orders = gets.chomp.to_i

puts "\n------------------------------Order-Receipt---------------------------------------"

no_of_orders.times do |order_count|
  puts "Enter details of Order : #{order_count += 1}"
  order = Order.new
  order.get_order_details
  order.get_order_receipt
  puts "\nOrder : #{order_count}"
  order.print_order_receipt
end




