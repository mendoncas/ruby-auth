class ExerciseSerie < ApplicationRecord
  validates :exercise_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true

  has_many :feedbacks
end
