# frozen_string_literal: true

class ChangeLatToBeFloatInRooms < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :lat, :float
  end
end
