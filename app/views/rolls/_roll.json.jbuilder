json.(roll, :id, :suffix, :code, :location, :total, :arrival_date, :info, :comment)
json.store_receipts roll.store_receipts do |receipt|
  json.(receipt, :id, :receipt_amount, :receipt_date)
end
