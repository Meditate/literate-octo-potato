class Throw < ApplicationRecord
  belongs_to :frame

  has_and_belongs_to_many :sequences

  validates :score, inclusion:  1..10, presence: true
  validates :attempt_number, inclusion: 1..3, presence: true
end
