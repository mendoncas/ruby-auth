class CreateExerciseSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_series do |t|
      t.integer :sets
      t.integer :reps
      t.references :exercise, foreign_key: true
      t.belongs_to :routine #consertar: deve pertencer a um routine day

      t.timestamps
    end
  end
end
