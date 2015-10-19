class Order < ActiveRecord::Base
  has_many :order_items
  has_many :store_receipts, through: :order_items
end
