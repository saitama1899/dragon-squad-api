# frozen_string_literal: true

class ChangeNameToBeTextInLocations < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :name, :text
  end
end
