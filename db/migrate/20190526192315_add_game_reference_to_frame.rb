class AddGameReferenceToFrame < ActiveRecord::Migration[5.0]
  def change
    add_reference :frames, :game, foreign_key: true
  end
end
