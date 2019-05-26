class CreateThrows < ActiveRecord::Migration[5.0]
  def change
    create_table :throws do |t|
      t.integer :score, null: false, default: 0
      t.string :presentation
      t.references :frame, foreign_key: true
      t.integer :attempt_number, null: false

      t.timestamps
    end
  end
end
