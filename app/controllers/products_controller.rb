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
    recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.directions = params[:directions]
    @recipe.prep_time = params[:prep_time]
    @recipe.chef = params[:chef]
    @recipe.image_url = params[:image_url]
    @recipe.save
    # combination of show and create
    render :show
    render json: { message: "test" }
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
end
