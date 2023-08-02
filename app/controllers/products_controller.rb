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
    p params
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
    )
    @product.save
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
    )
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "product destroyed successfully" }
  end
end
