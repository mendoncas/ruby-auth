class CreateExerciseSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_series do |t|
      t.integer :sets
      t.integer :reps
      t.references :exercise, foreign_key: {to_table: :exercise}
      t.belongs_to :routine
      t.references :routine, foreign_key: {to_table: :routine}
      
      t.timestamps
    end
  end
end
