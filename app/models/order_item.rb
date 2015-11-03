class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :roll
  has_one :store_receipt

  delegate :suffix, :name, :code, to: :roll
end
