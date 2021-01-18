class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :pain
      t.integer :effort
      t.string :observation
      # t.references :day, foreign_key: true
      # t.references :exercise_serie, foreign_key: true

      t.timestamps
    end
  end
end
