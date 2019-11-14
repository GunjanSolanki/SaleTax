
require "./calculator.rb"

class Item
  include Calculator

  def get_name(item, imported)
    if imported
      item.split().slice(0..4).join(" ")
    else
      item.split().slice(0..1).join(" ")
    end
  end

  def imported?(item)
    item["imported"]
  end

  def get_price(item)
    item.split()[-1]
  end

  def get_quantity(item)
    item.split()[0]
  end

  def total_item_price(price, quantity, sales_tax)
    total_price = price.to_f + calculate_tax(price, quantity, sales_tax)
    round_of_amount(total_price)
  end
end
