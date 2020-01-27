class ChangeLngToBeFloatInLocations < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :lng, :float
  end
end
