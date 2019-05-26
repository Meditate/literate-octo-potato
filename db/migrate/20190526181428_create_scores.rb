class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :frame, foreign_key: true
      t.integer :value, null: false, default: 0

      t.timestamps
    end
  end
end
