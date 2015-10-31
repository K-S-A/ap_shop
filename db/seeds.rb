# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group_list = [
  {name: 'Group1'},
  {name: 'Group2'},
  {name: 'Group3'}
  ]
textile_list = [
  {code: "150579", name: "Textile1", country: "TR", manufacturer: "CLASSI", man_code: "64876D", height: 300, units: "m", price: 999.99, group_id: 1},
  {code: "150578", name: "Textile2", country: "CN", manufacturer: "CLASSI", man_code: "64873A", height: 300, units: "m", price: 999.87, group_id: 1},
  {code: "150577", name: "Textile3", country: "TR", manufacturer: "CLASSI", man_code: "64879C", height: 300, units: "m", price: 99.90, group_id: 2},
]
roll_list = [
  {suffix: "", location: "1-1-2", comment: "First comment", textile_id: 1},
  {suffix: "a", location: "1-1-3", comment: "Second comment", textile_id: 1},
  {suffix: "b", location: "1-1-1", comment: "Third comment", textile_id: 1},
  {suffix: "", location: "1-3-2", comment: "Fourth comment", textile_id: 2},
  {suffix: "a", location: "2-1-2", comment: "Fifth comment", textile_id: 2}
]
arrival_list = [
  {roll_id: 1, arrival_date: "10-10-2015", total: 45.55, info: "Some comment1"},
  {roll_id: 2, arrival_date: "10-09-2015", total: 15.55, info: "Some comment2"},
  {roll_id: 3, arrival_date: "10-08-2015", total: 25.55, info: "Some comment3"},
  {roll_id: 4, arrival_date: "10-07-2015", total: 35.55, info: "Some comment4"},
  {roll_id: 5, arrival_date: "10-06-2015", total: 75.55, info: "Some comment5"}
]
order_list = [
  {number: "101", prepay: 100.00, discount: 0.00, order_date: "10-08-2015", customer: "Customer1", customer_phone: "+380951234567", status: "prepay", order_comment: "Ok.,,"},
  {number: "102", prepay: 900.00, discount: 100.00, order_date: "10-07-2015", customer: "Customer2", customer_phone: "+380951234565", status: "active", order_comment: "Ok.,,"},
  {number: "103", prepay: 1000.00, discount: 50.00, order_date: "10-06-2015", customer: "Customer3", customer_phone: "+380951234564", status: "processed", order_comment: "Ok.,,"}
]
order_item_list = [
  {order_id: 1, roll_id: 1, amount_ordered: 6.45, price_sold: 999.99, item_comment: "Comment1"},
  {order_id: 1, roll_id: 2, amount_ordered: 6.75, price_sold: 999.99, item_comment: "Comment2"},
  {order_id: 2, roll_id: 1, amount_ordered: 6.05, price_sold: 999.99, item_comment: "Comment3"},
  {order_id: 2, roll_id: 3, amount_ordered: 3.15, price_sold: 999.99, item_comment: "Comment4"},
  {order_id: 3, roll_id: 2, amount_ordered: 5.45, price_sold: 999.99, item_comment: "Comment5"}
]
store_receipt_list = [
  {order_item_id: 1, receipt_amount: 6.45, receipt_date: "04-09-2015"},
  {order_item_id: 2, receipt_amount: 6.75, receipt_date: "08-09-2015"},
  {order_item_id: 3, receipt_amount: 6.05, receipt_date: "05-09-2015"},
  {order_item_id: 4, receipt_amount: 3.15, receipt_date: "06-10-2015"},
  {order_item_id: 5, receipt_amount: 5.45, receipt_date: "06-09-2015"}
]

Group.create(group_list)
Textile.create(textile_list)
Roll.create(roll_list)
Arrival.create(arrival_list)
Order.create(order_list)
OrderItem.create(order_item_list)
StoreReceipt.create(store_receipt_list)
