class ExerciseSerie < ApplicationRecord
  validates :exercise_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  validates :routine, presence: true

  belongs_to :routine
end
