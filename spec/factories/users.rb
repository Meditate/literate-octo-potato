FactoryBot.define do
  factory :user do
    sequence(:api_key) { |n| "test_api_key_#{n}" }
  end
end
