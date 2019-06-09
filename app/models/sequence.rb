class Sequence < ApplicationRecord
  belongs_to :frame

  has_many :sequences_throws
  has_many :throws, through: :sequences_throws

  scope :active_sequences, -> { where(status: 0) }

  enum status: { active: 0, finished: 1 }

  validates :status, presence: true
  validates :number_of_throws, inclusion: 2..3, presence: true
  
  def self.active_for_user_in_game(user, game)
    where(frame: user.frames.where(game_id: game.id)).active_sequences 
  end

  def completed_with_throws?
    throws.count == number_of_throws
  end
  
  def score
    throws.sum(&:score)
  end

  def complete!
    finished! && frame.complete!
  end
end
