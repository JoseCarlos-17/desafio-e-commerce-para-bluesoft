FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "newuser#{n}" }
    sequence(:email) { |n| "useremail#{n}@email.com" }
    password { "12345678" }
    password_confirmation { "12345678" }    
  end
end
  