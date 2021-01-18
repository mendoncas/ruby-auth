class Feedback < ApplicationRecord
  # validates :routine_day, presence: true
  # validates :effort, presence: true
  # validates :exercise_serie, presence: true
  # validates :pain, presence: true

  belongs_to :exercise_serie
  has_one :day
end
