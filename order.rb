require "./tax.rb"
require "./item.rb"

class Order
  attr_accessor :total_tax, :total_bill, :items, :receipt
  
  def initialize
    self.items = []
    self.receipt = ''
    self.total_tax = 0
    self.total_bill = 0
  end

  def get_order_details
    puts "Enter number of items to order :\n"
    no_of_items = gets.chomp.to_i
    no_of_items.times do 
      puts "Enter Item description : "
      input_item = gets.chomp
      (ITEMS_LIST.include?(input_item)) ? items << Item.new(input_item) : (print "Invalid Item!\n")
    end
  end

  def get_order_receipt
    items.each do |item|
      item_details = item.get_item_receipt
      self.receipt += item_details[0]
      self.total_bill += item_details[1].to_f
      self.total_tax += item_details[2].to_f
    end
    receipt.concat("\nSales Tax: " + total_tax.to_s)
    receipt.concat("\nTotal: " + total_bill.to_s + "\n")
  end
  
  def print_order_receipt
    print receipt
    puts "\n-----------------------------------------------------------------------------------"
  end

end

