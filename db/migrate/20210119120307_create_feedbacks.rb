class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :day
      t.belongs_to :exercise_serie
      t.integer :pain
      t.integer :effort
      t.string :description

      t.timestamps
    end
  end
end
