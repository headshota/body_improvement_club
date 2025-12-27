class AddWorkoutRefToPerformedExercises < ActiveRecord::Migration[8.1]
  def change
    add_reference :performed_exercises, :workout, null: false, foreign_key: true
  end
end
