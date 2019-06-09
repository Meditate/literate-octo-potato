class Frame < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :sequence
  has_many :throws, dependent: :destroy

  acts_as_list scope: [:game_id, :user_id]

  enum status: { current: 0, finished: 1 }

  validates :status, presence: true
  
  delegate :score, to: :sequence
  
  def game_score
    game.score_for(user)
  end

  def complete!
    finished! && game_score.add_score(score)
  end

  def last_in_game?
    game.frames_count == position
  end
end
