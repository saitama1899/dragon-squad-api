class AddOnfireToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :onfire, :integer, default: 0
  end
end
