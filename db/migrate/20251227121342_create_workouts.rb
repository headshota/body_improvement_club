class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.datetime :started_at, null: false
      t.datetime :finished_at

      t.timestamps
    end
  end
end
