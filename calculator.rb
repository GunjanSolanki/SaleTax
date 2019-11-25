
module Calculator
  extend self
  def calculate_tax(price, quantity, sales_tax)
    tax = round_of_amount(price.to_f * quantity.to_f * sales_tax / 100)
    tax
  end

  def round_of_amount(amount) 
    amount.round(2)                                                            # round upto 2 decimal places
  end
  
end
