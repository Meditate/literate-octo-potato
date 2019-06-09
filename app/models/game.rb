class Game < ApplicationRecord
  has_many :frames
  has_many :scores

  validates :key, presence: true, uniqueness: true
  validates :frames_count, presence: true, numericality: { greater_than: 0 }

  def score_for(user)
    scores.find_by(user: user) 
  end
end
