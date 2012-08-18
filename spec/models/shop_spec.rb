require 'spec_helper'

describe Shop do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @shop = user.shops.build(name: 'Example Shop', shopname: 'exampleshop',
                                    description: 'the best pizzas',
                                    adress: 'Macon',
                                    info: '7/7') }

  subject { @shop }

  it { should be_valid }
  
  it {should respond_to :name }
  it {should respond_to :shopname }
  it {should respond_to :description }
  it {should respond_to :adress }
  it {should respond_to :info }
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Shop.new(user_id: 1)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when name is not present" do
    before { @shop.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is to long" do
    before { @shop.name = "a"*51 }
    it { should_not be_valid }
  end
  
  describe "when shopname is not present" do
    before { @shop.shopname = " " }
    it { should_not be_valid }
  end
  
  describe "when shopname is to long" do
    before { @shop.shopname = "a"*26 }
    it { should_not be_valid }
  end
  
  describe "when shopname format is invalid" do
    it "should be invalid" do
      shopnames = ["shop name", "shop@name", "shop.name", "shop+name"]
      shopnames.each do |invalid_shopname|
        @shop.shopname = invalid_shopname
        @shop.should_not be_valid
      end
    end
  end
  
  describe "when shopname format is valid" do
    it "should be valid" do
      shopnames = ["shopname", "shop-name", "shop_name", "SHOP_NAME"]
      shopnames.each do |valid_shopname|
        @shop.shopname = valid_shopname
        @shop.should be_valid
      end
    end
  end
  
  describe "shopname with mixed case" do
    let(:mixed_case_shopname) { "Shop-NAME"}
    
    it "should be saved as all lower-case" do
      @shop.shopname = mixed_case_shopname
      @shop.save
      @shop.reload.shopname.should == "shop-name"
    end
  end
  
  describe "when shopname is already taken" do
    before do
      shop_with_same_shopname = @shop.dup
      shop_with_same_shopname.save
      @shop.shopname.upcase!
    end
    it { should_not be_valid }
  end
  
  describe "when description is not present" do
    before { @shop.description = " " }
    it { should_not be_valid }
  end
  
  describe "when description is to long" do
    before { @shop.description = "a"* 161}
    it { should_not be_valid }
  end
  
  describe "when adress is not present" do
    before { @shop.adress = " " }
    it { should_not be_valid }
  end
  
  describe "when adress is to long" do
    before { @shop.adress = "a"* 161}
    it { should_not be_valid }
  end
  
  describe "when user as already a shop" do
    it "should not create a second shop" do
      first_shop = user.shops.build(name: 'First Shop', shopname: 'firstshop',
                                    description: 'the best pizzas',
                                    adress: 'Macon',
                                    info: '7/7') 
      first_shop.save
      @shop.should_not be_valid
    end
  end
end














