class CreateSequencesThrows < ActiveRecord::Migration[5.0]
  def change
    create_table :sequences_throws do |t|
      t.references :throw, foreign_key: true
      t.references :sequence, foreign_key: true

      t.timestamps
    end
  end
end
