class User < ActiveRecord::Base

  has_many :shops
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def has_shop?
    shops.any?
  end
  
  def shop
    shops.first
  end
  
  def own? aShop
    aShop.user == self
  end
end
