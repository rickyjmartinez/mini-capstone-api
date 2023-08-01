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

  def create
    @product = Product.new(name: "playmat", price: 10, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLf3GGwi6IaROnNX83pdy_DfNeAlZS1DOOj0OyXfRDtNLW0FlKjV8xPNwRZ-5qTv7saA&usqp=CAU", description: "something you play on")
    @product.save
    render template: "products/show"
  end
end
