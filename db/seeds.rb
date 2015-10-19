# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group_list = %w(Group1 Group2 Group3)
textile_list = [
  ["150579", "Textile1", "TR", "CLASSI", "64876D", 300, "m", 999.99, 1],
  ["150578", "Textile2", "CN", "CLASSI", "64873A", 300, "m", 999.87, 1],
  ["150577", "Textile3", "TR", "CLASSI", "64879C", 300, "m", 99.90, 2]
]
roll_list = [
  ["", "1-1-2", "First comment", 1],
  ["a", "1-1-3", "Second comment", 1],
  ["b", "1-1-1", "Third comment", 1],
  ["", "1-3-2", "Fourth comment", 2],
  ["a", "2-1-2", "Fifth comment", 2]
]
arrival_list = [
  [1, "10-10-2015", 45.55, "Some comment1"],
  [2, "10-09-2015", 15.55, "Some comment2"],
  [3, "10-08-2015", 25.55, "Some comment3"],
  [4, "10-07-2015", 35.55, "Some comment4"],
  [5, "10-06-2015", 75.55, "Some comment5"]
]
order_list = [
  ["10-08-2015", "Customer1", "+380951234567", "active", "Ok.,,"],
  ["10-07-2015", "Customer2", "+380951234565", "active", "Ok.,,"],
  ["10-06-2015", "Customer3", "+380951234564", "active", "Ok.,,"]
]
order_item_list = [
  [1, 1, 6.45, 999.99, "Comment1"],
  [1, 2, 6.75, 999.99, "Comment2"],
  [2, 1, 6.05, 999.99, "Comment3"],
  [2, 3, 3.15, 999.99, "Comment4"],
  [3, 2, 5.45, 999.99, "Comment5"]
]
store_receipt_list = [
  [1, 6.45, "04-09-2015"],
  [2, 6.75, "08-09-2015"],
  [3, 6.05, "05-09-2015"],
  [4, 3.15, "06-10-2015"],
  [5, 5.45, "06-09-2015"]
]

group_list.each { |name| Group.create(name: name) }

textile_list.each do |code, name, country, manufacturer, man_code, height, units, price, group_id|
  Textile.create(code: code,
                  name: name,
                  country: country,
                  manufacturer: manufacturer,
                  man_code: man_code,
                  height: height,
                  units: units,
                  price: price,
                  group_id: group_id)
end

roll_list.each do |suffix, location, comment, textile_id|
  Roll.create(suffix: suffix, location: location, comment: comment, textile_id: textile_id)
end

arrival_list.each do |roll_id, arrival_date, total, info|
  Arrival.create(roll_id: roll_id, arrival_date: arrival_date, total: total, info: info)
end

order_list.each do |order_date, customer, customer_phone, status, order_comment|
  Order.create(order_date: order_date, customer: customer, customer_phone: customer_phone, status: status, order_comment: order_comment)
end

order_item_list.each do |order_id, roll_id, amount_ordered, price_sold, item_comment|
  OrderItem.create(order_id: order_id, roll_id: roll_id, amount_ordered: amount_ordered, price_sold: price_sold, item_comment: item_comment)
end

store_receipt_list.each do |order_item_id, receipt_amount, receipt_date|
  StoreReceipt.create(order_item_id: order_item_id, receipt_amount: receipt_amount, receipt_date: receipt_date)
end

