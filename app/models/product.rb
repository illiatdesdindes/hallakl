class Product < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :description, :name, :price
  
  validates_presence_of :name, :description, :price
  validates :name, length: {maximum: 30}
  validates :description, length: {maximum: 140}
  validates :price, numericality: {greater_than_or_equal_to: 0}

end
