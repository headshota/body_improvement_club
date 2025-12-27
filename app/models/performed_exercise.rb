class PerformedExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :performed_sets
end
