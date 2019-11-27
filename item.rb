require "./calculator.rb"
require "./tax.rb"

ITEMS_LIST = ["1 book at 12.49", "1 CD at 14.99", "1 chocolate bar at 0.85",
  "1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50",
  "1 imported bottle of perfume at 27.99", "1 perfume at 18.99", "1 pill at 9.75",
  "1 imported box of chocolates at 11.25"].freeze

TAX_FREE_ITEMS = %w(book chocolate chocolates pills).freeze

class Item
  attr_accessor :product, :receipt

  def initialize(product)
    self.product = product
    self.receipt = ''
  end

  def get_name
    imported? ? (product.split().slice(0..4).join(" ")) : (product.split().slice(0..1).join(" "))
  end

  def imported?
    product["imported"]
  end

  def get_price
    product.split()[-1]
  end

  def get_quantity
    product.split()[0]
  end

  def total_item_price
    total_price = get_price.to_f + Calculator.calculate_tax(get_price, get_quantity, item_sales_tax)
    Calculator.round_of_amount(total_price)
  end

  def tax_free?
    item_name = get_name.split()[-1]
    TAX_FREE_ITEMS.include?(item_name)
  end

  def item_sales_tax
    sales_tax = Tax.sales_tax(imported?, tax_free?)
  end

  def total_item_tax
    total_tax = Calculator.calculate_tax(get_price, get_quantity, item_sales_tax)
    Calculator.round_of_amount(total_tax)
  end

  def get_item_receipt
    self.receipt.concat(get_name + " : " + total_item_price.to_s + "\n")
    total_bill = total_item_price
    total_tax = Calculator.calculate_tax(get_price, get_quantity, item_sales_tax)
    item_details = [self.receipt, total_bill, total_tax]
  end

end
