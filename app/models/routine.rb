class Routine < ApplicationRecord
  has_many :exercise_series, dependent: :destroy
end
