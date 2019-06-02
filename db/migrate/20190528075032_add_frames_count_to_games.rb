class AddFramesCountToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :frames_count, :integer, null: false, default: 10
  end
end
