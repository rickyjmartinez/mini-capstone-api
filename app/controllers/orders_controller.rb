class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render :index
  end

  # def create
  #   #subtotal == price * quantity
  #   product = Product.find_by(id: params[:product_id])
  #   calculated_subtotal = params[:quantity].to_i * product.price
  #   calculated_tax = calculated_subtotal * 0.09
  #   calculated_total = calculated_subtotal + calculated_tax

  #   if current_user
  #     #carted_products controller***
  #     @carted_products = []
  #     #if current_user
  #     current_user.carted_products.each do |carted_product|
  #       if carted_product.status == "carted"
  #         @carted_products << carted_product
  #       end
  #     end
  #     #render :index
  #     #^this is from carted_products controller**

  #     @order = Order.new(
  #       user_id: current_user.id,
  #       product_id: params[:product_id], #use params if user gets to chose them
  #       quantity: params[:quantity],
  #       subtotal: calculated_subtotal,
  #       tax: calculated_tax,
  #       total: calculated_total,
  #     )
  #     @order.save
  #     render :show
  #   else
  #     render json: { message: "please log in to place an order" }, status: 422
  #   end
  # end

  def create
    # figure out what items are in this person's shopping cart
    # @carted_products =  current_user.carted_products.where(status: 'carted')
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    # figure out how much they all cost
    calculated_subtotal = 0
    @carted_products.each do |cp|
      calculated_subtotal += cp.product.price * cp.quantity
    end
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    # add all that up
    # tax + total

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    # ....
    # backfill those items and change status to 'purchased'
    # change order_id to the order id
    @carted_products.each do |cp|
      cp.update(
        status: "purchased",
        order_id: @order.id,
      )
    end

    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unathorized
    end
  end
end
