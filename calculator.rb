
module Calculator
  extend self
  def calculate_tax(price, quantity, sales_tax)
    tax = price.to_f * quantity.to_f * sales_tax
    round_of_amount(tax / 100) 
  end

  def round_of_amount(amount) 
    amount.round(2)                                                   # round upto 2 decimal places
  end
  
end

