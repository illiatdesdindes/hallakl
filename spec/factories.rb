FactoryGirl.define do
  factory :user do
    #sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :shop do
    sequence(:name) { |n| "My Shop #{n}" }
    sequence(:shopname) { |n| "my-shop-#{n}" }
    description "My great shop !!"
    adress "Somewhere over the rainbow"
    info "Lorem ipsum empor incididunt ut labore et Sunt in culpa"
    user
  end
end

