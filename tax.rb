
module Tax
  def self.sales_tax(imported, tax_free)                            # tax applicable
    return self.tax_on_tax_free_items(imported) if tax_free
    return 15 if imported
    10
  end

  private
  def self.tax_on_tax_free_items(imported)                          # tax applicable on tax free items
    return 5 if imported
    0
  end

end
