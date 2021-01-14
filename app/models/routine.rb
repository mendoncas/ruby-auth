class Routine < ApplicationRecord
  validates :beginning, presence: true
  validates :end, presence: true
  has_many :exercise_series, dependent: :destroy
end
