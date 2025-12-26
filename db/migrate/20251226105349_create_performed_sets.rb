class CreatePerformedSets < ActiveRecord::Migration[8.1]
  def change
    create_table :performed_sets do |t|
      t.references :performed_exercise, foreign_key: true
      t.integer :performed_reps
      t.integer :duration_in_seconds
      t.float :rpe
      t.boolean :rest_after, default: true, null: false

      t.datetime :done_at
      t.timestamps
    end
  end
end
