# frozen_string_literal: true

class RemoveLatFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :lat, :decimal
  end
end
