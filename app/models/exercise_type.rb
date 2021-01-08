class ExerciseType < ApplicationRecord
  has_many :exercises, dependent: :destroy
end
