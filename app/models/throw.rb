class Throw < ApplicationRecord
  belongs_to :frame

  has_many :sequences_throws
  has_many :sequences, through: :sequences_throws

  validates :score, inclusion:  0..10, presence: true
  validates :attempt_number, inclusion: 1..3, presence: true
end
