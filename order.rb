require "./tax.rb"
require "./item.rb"
require "./input.rb"

TAX_FREE_ITEMS = %w[book chocolate chocolates pills]
TAX_FREE_ITEMS.freeze

class Order
  attr_accessor :total_tax, :total_bill, :item_description, :item_price

  def initialize
    self.total_tax = 0
    self.total_bill = 0
    self.item_description = ""
    self.item_price = 0
  end

  def print_product_details(order)
    order.each do |item|
      get_product_details(item)
      print_order_receipt(item_description, item_price)
    end
    print_amount_receipt(total_tax, total_bill)
  end

  def get_product_details(item)
    imported = Item.imported?(item)
    self.item_description = ""
    self.item_description += Item.get_name(item, imported)
    item_name = self.item_description.split()[-1]
    tax_free = TAX_FREE_ITEMS.include?(item_name)
    price = Item.get_price(item)
    quantity = Item.get_quantity(item)
    sales_tax = Tax.sales_tax(imported, tax_free)
    self.item_price = Item.total_item_price(price, quantity, sales_tax)
    calculate_total(price, quantity, sales_tax, item_price)
  end
  
  def calculate_total(price, quantity, sales_tax, item_price)
    self.total_tax += Calculator.calculate_tax(price, quantity, sales_tax)
    self.total_bill += item_price
  end

  private

  def print_order_receipt(item_description, item_price)
    receipt = "\n"
    receipt.concat(item_description + " : " + item_price.to_s + "\n")
    print receipt
  end

  def print_amount_receipt(total_tax, total_bill)
    receipt = ""
    self.total_tax = 0
    self.total_bill = 0
    receipt.concat("\nSales Tax: " + total_tax.to_s)
    receipt.concat("\nTotal: " + total_bill.to_s + "\n")
    print receipt
    puts "\n-----------------------------------------------------------------------------------"
  end
end
