
module Calculator
  def calculate_tax(price, quantity, sales_tax)
    round_of_amount(price.to_f * quantity.to_f * sales_tax / 100)
  end

  def round_of_amount(amount)                                        #round to 2 decimal place
    ((amount * 100).round / 100.0)
  end
end
