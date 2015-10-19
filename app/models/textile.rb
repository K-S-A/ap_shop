class Textile < ActiveRecord::Base
  belongs_to :group
  has_many :rolls
end
