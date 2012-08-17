require 'spec_helper'

describe Shop do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @shop = user.shops.build(name: 'Example Shop', shopname: 'exampleshop',
                                    description: 'the best pizzas',
                                    adress: 'Macon',
                                    info: '7/7') }
  it {should respond_to :name }
  it {should respond_to :shopname }
  it {should respond_to :description }
  it {should respond_to :adress }
  it {should respond_to :info }
end
