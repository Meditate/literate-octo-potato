class AddPositionToFrame < ActiveRecord::Migration[5.0]
  def change
    add_column :frames, :position, :integer
  end
end
