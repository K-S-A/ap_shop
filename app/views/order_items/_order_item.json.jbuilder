json.(order_item, :id, :order_id, :roll_id, :suffix, :name, :code, :amount_ordered, :price_sold, :item_comment)
json.status order_item.order.status
json.order order_item.order.number
if order_item.store_receipt
  json.store_receipt(order_item.store_receipt, :id, :receipt_amount, :receipt_date)
end
