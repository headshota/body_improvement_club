class DropSortOrderOnPerformedExercises < ActiveRecord::Migration[8.1]
  def change
    remove_column :performed_exercises, :sort_order
  end
end
