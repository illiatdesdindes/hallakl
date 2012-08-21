require 'spec_helper'

describe "StaticPages" do
  subject {page}
  
  describe "Home page" do
    before {visit root_path}
    
    it { should have_content 'Welcome' }
  end
  
  describe "Help page" do
    before {visit help_path}
    it {should have_selector "h1", text: "Aide" }
  end
  
  it "should have the right link on the layout" do
    visit root_path
    click_link 'Aide'
    page.should have_selector "h1", text: "Aide"
    click_link "Accueil"
    page.should have_content "Welcome"
    click_link "Hallakl"
    page.should have_content "Welcome"
  end
end
