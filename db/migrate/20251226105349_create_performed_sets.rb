class CreatePerformedSets < ActiveRecord::Migration[8.1]
  def change
    create_table :performed_sets do |t|
      t.timestamps
    end
  end
end
