class RemoveLngFromRooms < ActiveRecord::Migration[6.0]
  def change

    remove_column :rooms, :lng, :decimal
  end
end
