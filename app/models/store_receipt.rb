class StoreReceipt < ActiveRecord::Base
  belongs_to :order_item

  delegate :roll, :order, to: :order_item
end
