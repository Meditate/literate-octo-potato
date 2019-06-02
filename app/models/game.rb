class Game < ApplicationRecord
  has_many :frames
  has_many :scores

  validates :key, presence: true
  validates :frames_count, presence: true, numericality: { greater_than: 0 }

  def score_for(user)
    scores.where(user: user) 
  end
end
