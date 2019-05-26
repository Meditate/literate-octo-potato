class CreateThrowsSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :throws_sequences do |t|
      t.references :throw, foreign_key: true
      t.references :sequence, foreign_key: true

      t.timestamps
    end
  end
end
