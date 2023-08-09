class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end

  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:product_id],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],

      # name: params[:name],
      # price: params[:price],
      # description: params[:description],
      # supplier_id: params[:supplier_id],
    )

    if @order.save
      render :show
    else
      render json: { error: @order.errors.full_messages }, status: 422
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    render :show
  end
end
