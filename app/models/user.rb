class User < ApplicationRecord
  has_many :frames
  has_many :scores

  validates :api_key, presence: true, uniqueness: true

  def can_have_a_frame?(game)
    return false if frames.where(game: game).count >= game.frames_count

    true
  end
end
