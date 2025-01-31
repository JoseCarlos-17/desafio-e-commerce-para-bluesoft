FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "myString#{n}@email.com" }
    password { "123123123" }
    password_confirmation { "123123123" }
  end
end
  