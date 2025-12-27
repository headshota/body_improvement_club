class PerformedExercise < ApplicationRecord
  belongs_to :exercise
  has_many :performed_sets
end
