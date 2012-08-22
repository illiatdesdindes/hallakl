require 'spec_helper'

describe Product do
  let(:shop) { FactoryGirl.create(:shop) }
  before { @product = shop.products.build(name: "Kebab", 
                                         description: "traditional kebab",
                                         price: 6.00) }
  subject { @product }
  
  it { should be_valid }
  its(:shop) { should == shop }
  
  
  describe "accessible attributes" do
    it "should not allow access to shop_id" do
      expect do
        Product.new(shop_id: shop.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe 'when name is not present' do
    before { @product.name = ' ' }
    it { should_not be_valid } 
  end
  
  describe 'when name is too long' do
    before { @product.name = 'a'*31 }
    it { should_not be_valid }
  end
  
  describe 'when description is not present' do
    before { @product.description = ' ' }
    it { should_not be_valid }
  end
  
  describe 'when description is too long' do
    before { @product.description = 'a'*141 }
    it { should_not be_valid }
  end
  
  describe 'when price is not present' do
    before { @product.price = ' ' }
    it { should_not be_valid }
  end
  
  describe 'price should be positive' do
    it 'should not be negative' do
      @product.price = -1
      @product.should_not be_valid
    end
    
    it 'can be equal to 0' do
      @product.price = 0
      @product.should be_valid
    end
    
    it 'should be positive' do
      @product.price = 1
      @product.should be_valid
    end
  end
end






