class Score < ApplicationRecord
  belongs_to :frame

  validates :value, presence: true
end
