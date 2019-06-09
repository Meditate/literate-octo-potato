class Throw < ApplicationRecord
  acts_as_list scope: :frame, column: :attempt_number

  belongs_to :frame

  has_many :sequences_throws, dependent: :destroy
  has_many :sequences, through: :sequences_throws

  validates :score, inclusion:  0..10, presence: true
  validates :attempt_number, numericality: { less_than: 3 }
end
