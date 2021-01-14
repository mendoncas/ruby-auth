class ExerciseSerie < ApplicationRecord
  validates :exercise_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
end
