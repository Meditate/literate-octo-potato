class CreateFrames < ActiveRecord::Migration[5.0]
  def change
    create_table :frames do |t|
      t.references :user, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
