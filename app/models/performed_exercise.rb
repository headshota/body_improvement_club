class PerformedExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  has_many :performed_sets, dependent: :destroy

  before_create :assign_sort_order


  private

  def assign_sort_order
    self.sort_order = 1
  end
end
