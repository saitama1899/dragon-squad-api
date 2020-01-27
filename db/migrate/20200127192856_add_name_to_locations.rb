class AddNameToLocations < ActiveRecord::Migration[6.0]
  def change
    add_index :locations, :name, unique: true
  end
end
