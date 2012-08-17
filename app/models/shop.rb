class Shop < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :adress, :description, :info, :name, :shopname, :user
end
