class AddWeightOnPerformedSets < ActiveRecord::Migration[8.1]
  def change
    add_column :performed_sets, :weight, :decimal, precision: 4
  end
end
