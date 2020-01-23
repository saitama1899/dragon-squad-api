class ChangeLngToBeFloatInRooms < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :lng, :float
  end
end
