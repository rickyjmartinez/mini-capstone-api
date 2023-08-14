class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    @carted_product.save
    render json: { message: "carted product created" }
  end

  def index
    # @carted_products = CartedProduct.all
    # render :index
    @carted_products = []
    if current_user
      current_user.carted_products.each do |carted_product|
        if carted_product.status == "carted"
          @carted_products << carted_product
        end
      end
      render :index
      # @carted_products == current_user.carted_products && carted_product.status == "carted"
      # render :index
    else
      render json: { message: "you have nothing in cart" }
    end
  end
end
