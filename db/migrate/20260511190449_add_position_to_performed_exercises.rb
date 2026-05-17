class AddPositionToPerformedExercises < ActiveRecord::Migration[8.1]
  def change
    add_column :performed_exercises, :position, :integer, null: false
    add_index :performed_exercises, [ :workout_id, :position ], unique: true
  end
end
