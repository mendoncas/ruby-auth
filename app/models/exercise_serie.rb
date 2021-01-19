class ExerciseSerie < ApplicationRecord
  validates :exercise_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
<<<<<<< HEAD

  has_many :feedbacks
=======
  validates :routine, presence: true

  belongs_to :routine
>>>>>>> eb127a727c5af4c42087b886ffd289fa9249c374
end
