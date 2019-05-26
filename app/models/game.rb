class Game < ApplicationRecord
  has_many :frames

  validates :key, presence: true
end
