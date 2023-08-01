class ProductsController < ApplicationController
  # def all
  #   @products = Product.all
  #   render template: "products/index"
  # end

  def index
    @products = Product.all
    render template: "products/index"
  end

  # def get_first_product
  #   @product = Product.first
  #   render template: "products/show"
  # end

  def show
    p params["id"] # == 2
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end
end
