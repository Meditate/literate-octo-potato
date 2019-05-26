class Frame < ApplicationRecord
  belongs_to :user

  enum status: { current: 0, finished: 1 }

  validates :status, presence: true
end
