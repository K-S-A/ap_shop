class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:order_items).all
  end

  def create
    @order = Order.create(order_params)
  end

private

  def order_params
    params[:order][:order_items_attributes] = params[:order][:order_items]
    params.require(:order).permit(:discount, :prepay, :order_comment, :status, :customer_phone, :customer, :number, :order_date, order_items_attributes: [:roll_id, :amount_ordered, :price_sold, :item_comment])
  end

end
