class AddGameReferenceToScores < ActiveRecord::Migration[5.0]
  def change
    remove_reference :scores, :frame, foreign_key: true
    add_reference :scores, :user, foreign_key: true
    add_reference :scores, :game, foreign_key: true
  end
end
