class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.belongs_to :exercise_type
      t.string :name
      t.string :video_directory
      t.string :description

      t.timestamps
    end
  end
end
