FactoryBot.define do
  factory :frame do
    sequence(:position) { |n| n }
    status { 0 }
    user
    game
  end
end
