class AddUniqOnGamesKey < ActiveRecord::Migration[5.0]
  def change
    add_index :games, :key, unique: true
  end
end
