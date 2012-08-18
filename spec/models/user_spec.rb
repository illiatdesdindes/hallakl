require 'spec_helper'

describe User do
  before { @user = User.new(email: "person@example.com",
                            password: "foobar",
                            password_confirmation: "foobar") }
                            
end
