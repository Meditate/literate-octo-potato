FactoryBot.define do
  factory :score do
    value { 0 }

    trait :with_related_data do
      user
      game
    end
  end
end
