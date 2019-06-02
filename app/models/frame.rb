class Frame < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :sequence
  has_many :throws

  acts_as_list scope: [:game, :user]

  enum status: { current: 0, finished: 1 }

  validates :status, presence: true
  
  delegate :score, to: :sequence
  
  def game_score
    game.score_for(user)
  end

  def name
    name = 
      if frame.score == 10
        if frame.throws.count == 2
          :spare
        elsif frame.throws.count == 1
          :strike
        end
      end
    name || :basic
  end

  def complete!
    game_score.add_score(score)
  end

  def last_in_game?
    game.frames_count == position
  end
end

# Reference score with user and game, and update it on sequence finish
