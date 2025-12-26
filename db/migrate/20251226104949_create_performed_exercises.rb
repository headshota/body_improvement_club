class CreatePerformedExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :performed_exercises do |t|
      t.timestamps
    end
  end
end
