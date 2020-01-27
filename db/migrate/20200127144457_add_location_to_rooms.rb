class AddLocationToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :location, foreign_key: true
  end
end
