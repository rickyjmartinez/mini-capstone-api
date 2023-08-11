class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   #get to join table
  #   category_products.each do |cp|
  #     cp.product
  #   end
  #   #go to each, find product_id
  # end
end
