FactoryBot.define do
  factory :product do
    price { 50 }
    sequence(:name) { |n| "myString#{n}" }
    sequence(:description) { |n| "loremIpsum#{n}" }    
  end
end
