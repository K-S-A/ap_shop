class Group < ActiveRecord::Base
  has_many :textiles
  has_many :rolls, through: :textiles
end
