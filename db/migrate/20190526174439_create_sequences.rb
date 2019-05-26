class CreateSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :sequences do |t|
      t.integer :status, null: false, default: 0
      t.integer :number_of_throws, null: false, default: 2
      t.references :frame, foreign_key: true

      t.timestamps
    end
  end
end
