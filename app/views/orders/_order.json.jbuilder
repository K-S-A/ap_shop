json.(order, :id, :discount, :prepay, :order_comment, :status, :customer_phone, :customer, :number, :order_date, :order_items)
json.order_items do
  json.array! order.order_items, partial: 'order_items/order_item', as: :order_item
end
