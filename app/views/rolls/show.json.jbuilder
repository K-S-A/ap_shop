json.(@roll, :id, :suffix, :code, :location, :total, :sold, :left, :arrival_date, :info, :comment)
json.receipts @roll.store_receipts do |receipt|
  json.(receipt, :id, :receipt_amount, :receipt_date)
end
