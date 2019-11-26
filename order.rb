require "./tax.rb"
require "./item.rb"

ITEM_LIST = ["1 book at 12.49", "1 CD at 14.99", "1 chocolate bar at 0.85",
  "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
  "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pill at 9.75",
  "1 imported box of chocolates at 11.25"].freeze

class Order
  attr_accessor :total_tax, :total_bill, :item_price, :items, :sales_tax

  def initialize
    self.total_tax = 0
    self.total_bill = 0
    self.item_price = 0
    self.items = []
  end

  def get_order_details
    puts "Enter number of items to order :\n"
    no_of_items = gets.chomp.to_i
    no_of_items.times do 
      add_item_description
    end
  end
  
  def print_receipt
    items.each do |product|
      item = Item.new(product)
      print_order_receipt(item)
    end
    print_amount_receipt
  end
  
  private
  
  def add_item_description
    puts "Enter Item description : "
    input_item = gets.chomp
    (ITEM_LIST.include?(input_item)) ? (items << input_item) : (print "Invalid Item!\n")
  end

  def print_order_receipt(item)
    self.item_price = 0
    self.item_price += item.total_item_price
    receipt = "\n"
    receipt.concat(item.get_name + " : " + item_price.to_s + "\n")
    print receipt
    calculate_total_amount(item)
  end
  
  def calculate_total_amount(item)
    self.total_tax += Calculator.calculate_tax(item.get_price, item.get_quantity, item.item_sales_tax)
    self.total_bill += item_price
  end
  
  def print_amount_receipt
    receipt = ""
    receipt.concat("\nSales Tax: " + total_tax.to_s)
    receipt.concat("\nTotal: " + total_bill.to_s + "\n")
    print receipt
    puts "\n-----------------------------------------------------------------------------------"
  end

end
