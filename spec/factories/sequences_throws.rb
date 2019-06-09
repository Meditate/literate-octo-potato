FactoryBot.define do
  factory :sequences_throw do
    association :throw, factory: :throw
    association :sequence, factory: :sequence
  end
end
