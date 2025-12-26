class CreatePerformedExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :performed_exercises do |t|
      t.references :exercise, foreign_key: true
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
