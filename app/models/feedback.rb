class Feedback < ApplicationRecord
  validates :exercise_serie, presence: true
  validates :day, presence: true

  belongs_to :day
  belongs_to :exercise_serie
end
