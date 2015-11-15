class OrderItemsController < ApplicationController

  def index
    @order_items = find_order_items.all
  end

private

  def find_order_items
    OrderItem.includes(:order, :store_receipt, roll: :textile)
  end

end
