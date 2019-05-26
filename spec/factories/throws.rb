FactoryBot.define do
  factory :throw do
    score { 1 }
    presentation { "X" }
    frame
    attempt_number { 1 }
  end
end
