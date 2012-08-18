class Shop < ActiveRecord::Base
  
  belongs_to :user

  attr_accessible :adress, :description, :info, :name, :shopname
  
  before_save { self.shopname.downcase! }
  
  validate :check_user_shops_quota, :on => :create
  
  validates_presence_of :name, :shopname, :description, :adress
  validates :name, length: {maximum: 50}
  validates :description, length: {maximum: 160}
  validates :adress, length: {maximum: 160}
  VALID_SHOPNAME_REGEX = /\A[\w-]+\z/i
  validates :shopname, format: {with: VALID_SHOPNAME_REGEX}, 
                       length: {maximum:25},
                       uniqueness: {case_sensitive: false }
  validates :info, length: {maximum: 600}                     
  private
  
    def check_user_shops_quota
      unless self.user.shops.count == 0
        errors[:base] << "Vous avez deja un magasin"
      end
    end
end


