class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.decimal :result
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
