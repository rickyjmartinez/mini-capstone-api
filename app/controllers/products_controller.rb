class ProductsController < ApplicationController
  def all
    @products = Product.all
    render template: "products/index"
  end

  def get_first_product
    @product = Product.first
    render template: "products/show"
  end
end
