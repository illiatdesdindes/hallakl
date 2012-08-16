require 'spec_helper'

describe "UserPages" do

  subject {page}

  describe "Sign up" do
    before { visit new_user_registration_path }
    
    let(:submit) {"Sign up"}
    
    describe "with invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector("h2", text: "Sign up") }
        it { should have_content("error") }
      end
    end
    
    describe "with valid information" do
      before do
        fill_in_sign_up_form
      end
      
      it "should create a user" do
        expect { click_button submit}.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before do 
          # ActionMailer::Base.deliveries = []
          click_button submit
        end
      
        it { should have_selector('div.alert', text: 'Welcome') }
        it { should have_link('Sign out') }
      
#        describe "Email confirmation" do
#          let(:mail_confirmation) { ActionMailer::Base.deliveries.first }
#          
#          describe "user before confirmation" do
#            it "should not be confirmed" do
#              User.find_by_email('person@example.com').confirmed?.should == false
#            end
#          end
#        end
      end
    end
  end
  
  describe 'Profile page' do
    let(:user) { FactoryGirl.create(:user) }
    
    before { visit user_path(user) }
    
    it { should have_selector('h2', text: user.email) }
  end
end
