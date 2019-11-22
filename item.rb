require "./calculator.rb"

class Item
  def self.get_name(item, imported)
    imported ? (item.split().slice(0..4).join(" ")) : (item.split().slice(0..1).join(" "))
  end

  def self.imported?(item)
    item["imported"]
  end

  def self.get_price(item)
    item.split()[-1]
  end

  def self.get_quantity(item)
    item.split()[0]
  end

  def self.total_item_price(price, quantity, sales_tax)
    total_price = price.to_f + Calculator.calculate_tax(price, quantity, sales_tax)
    Calculator.round_of_amount(total_price)
  end

end
