class PerformedExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :performed_sets, dependent: :destroy


  # declares that scope for position attribute used for explicit sorting, is workout
  # in other words, performed exercises are positioned relative to their workout, not globally
  positioned on: :workout
end
