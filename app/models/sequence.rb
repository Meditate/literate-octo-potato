class Sequence < ApplicationRecord
  belongs_to :frame

  has_and_belongs_to_many :throws

  enum status: { opened: 0, finished: 1 }

  validates :status, presence: true
  validates :number_of_throws, inclusion: 2..3, presence: true
end
