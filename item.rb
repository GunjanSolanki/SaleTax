require "./calculator.rb"

TAX_FREE_ITEMS = %w(book chocolate chocolates pills).freeze

class Item
  attr_accessor :product, :item_description

  def initialize(product)
    self.product = product
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

  def total_item_price(sales_tax)
    total_price = get_price.to_f + Calculator.calculate_tax(get_price, get_quantity, sales_tax)
    Calculator.round_of_amount(total_price)
  end

  def tax_free?
    item_name = get_name.split()[-1]
    TAX_FREE_ITEMS.include?(item_name)
  end

  def get_product_details
    imported = imported?
    item_description = get_name
    price = get_price
    quantity = get_quantity
  end

end
