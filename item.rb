require "./calculator.rb"

class Item
  attr_accessor :product
  
  def initialize(product)
    self.product = product
  end

  def get_name(imported)
    imported ? (product.split().slice(0..4).join(" ")) : (product.split().slice(0..1).join(" "))
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

  def total_item_price(price, quantity, sales_tax)
    total_price = price.to_f + Calculator.calculate_tax(price, quantity, sales_tax)
    Calculator.round_of_amount(total_price)
  end

end
