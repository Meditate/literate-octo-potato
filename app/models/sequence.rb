class Sequence < ApplicationRecord
  belongs_to :frame

  has_many :sequences_throws
  has_many :throws, through: :sequences_throws

  enum status: { opened: 0, finished: 1 }

  validates :status, presence: true
  validates :number_of_throws, inclusion: 2..3, presence: true
end
