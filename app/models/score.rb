class Score < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :value, presence: true

  def add_score(score)
    update(value: (value + score))
  end
end
