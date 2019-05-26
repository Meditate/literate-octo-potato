class Frame < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :score

  enum status: { current: 0, finished: 1 }

  validates :status, presence: true
end
