class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :api_key, null: false

      t.timestamps

      t.index :api_key, unique: true
    end
  end
end
