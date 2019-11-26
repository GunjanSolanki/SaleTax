require "./tax.rb"
require "./item.rb"

ITEMS_LIST = ["1 book at 12.49", "1 CD at 14.99", "1 chocolate bar at 0.85",
  "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
  "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pill at 9.75",
  "1 imported box of chocolates at 11.25"].freeze

class Order
  attr_accessor :total_tax, :total_bill, :total_item_price, :items, :receipt, :sales_tax

  def initialize
    self.total_tax = 0
    self.total_bill = 0
    self.items = []
    self.receipt = ''
  end

  def get_order_details
    puts "Enter number of items to order :\n"
    no_of_items = gets.chomp.to_i
    no_of_items.times do 
      puts "Enter Item description : "
      input_item = gets.chomp
      (ITEMS_LIST.include?(input_item)) ? (items << input_item) : (print "Invalid Item!\n")
    end
  end

  def get_item_receipt
    items.each do |product|
      item = Item.new(product)
      get_receipt(item)
    end
  end

  def print_receipt
    print receipt
    print_amount_receipt
  end

  private
  
  def get_receipt(item)
    self.total_item_price = 0
    self.total_item_price = item.total_item_price
    self.receipt.concat(item.get_name + " : " + total_item_price.to_s + "\n")
    self.total_bill += total_item_price
    self.total_tax += Calculator.calculate_tax(item.get_price, item.get_quantity, item.item_sales_tax)
  end
  
  def print_amount_receipt
    self.receipt = ""
    self.receipt.concat("\nSales Tax: " + total_tax.to_s)
    self.receipt.concat("\nTotal: " + total_bill.to_s + "\n")
    print receipt
    puts "\n-----------------------------------------------------------------------------------"
  end

end

