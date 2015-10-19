class Roll < ActiveRecord::Base
  belongs_to :textile
  has_one :arrival, dependent: :destroy
  has_many :order_items
  has_many :store_receipts, through: :order_items

  delegate :group, :name, :code, :height, :country, :manufacturer, :man_code, :units, to: :textile
  delegate :total, :arrival_date, :info, to: :arrival

  def sold
    self.store_receipts.sum(:receipt_amount)
  end

  def left
    self.total - self.sold
  end

end
