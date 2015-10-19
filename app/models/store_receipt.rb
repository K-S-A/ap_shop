class StoreReceipt < ActiveRecord::Base
  belongs_to :order_item

  delegate :roll, to: :order_item
end
