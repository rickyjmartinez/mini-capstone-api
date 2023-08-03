class Product < ApplicationRecord
  def is_discounted?
    #returns true if item is <=10
    #returns false otherwise (else)

    if price <= 10
      return true
    else
      return false
    end
  end
end
