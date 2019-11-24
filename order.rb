require "./tax.rb"
require "./item.rb"
require "./cart.rb"

TAX_FREE_ITEMS = %w(book chocolate chocolates pills).freeze

class Order
  attr_accessor :total_tax, :total_bill, :item_description, :item_price

  def initialize
    self.total_tax = 0
    self.total_bill = 0
    self.item_description = ""
    self.item_price = 0
  end

  def print_receipt(cart)
    cart.each do |product|
      item = Item.new
      get_product_details(item, product)
      print_order_receipt(item_description, item_price)
    end
    print_amount_receipt(total_tax, total_bill)
  end
  
  def get_product_details(item, product)
    imported = item.imported?(product)
    tax_free = tax_free?(item, product, imported)
    price = item.get_price(product)
    quantity = item.get_quantity(product)
    sales_tax = Tax.sales_tax(imported, tax_free)
    self.item_price = item.total_item_price(price, quantity, sales_tax)
    calculate_total(price, quantity, sales_tax, item_price)
  end

  def tax_free?(item, product, imported)
    self.item_description = ""
    self.item_description += item.get_name(product, imported)
    item_name = self.item_description.split()[-1]
    tax_free = TAX_FREE_ITEMS.include?(item_name)
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
    receipt.concat("\nSales Tax: " + total_tax.to_s)
    receipt.concat("\nTotal: " + total_bill.to_s + "\n")
    print receipt
    puts "\n-----------------------------------------------------------------------------------"
  end

end
