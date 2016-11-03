class AddMaxDistanceToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :max_distance, :string
  end
end
