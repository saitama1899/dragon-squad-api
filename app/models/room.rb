# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :room_stats, dependent: :destroy
  belongs_to :location
  validates_presence_of :title, length: { in: 6..30 }
  validates_presence_of :description, length: { maximum: 300 }
  validates_presence_of :price, numericality: true, greater_than: 0

  validates :bills_included, inclusion: { in: [ true, false ] }
  validates :deposit, inclusion: { in: [ true, false ] }

  validates :verified, inclusion: { in: [ true, false ] }

  validates_presence_of :roommate_girls, numericality: { :greater_than_or_equal_to => 0 }
  validates_presence_of :roommate_boys, numericality: { :greater_than_or_equal_to => 0 }

  validates_presence_of :room_size, numericality: { :greater_than_or_equal_to => 0 }
  validates_presence_of :property_size, numericality: { :greater_than_or_equal_to => 0 }

  after_create :roomIncrement

  # callbacks
  private

  def roomIncrement
    location = Location.find_by_id(location_id)
    location.total_rooms += 1
    location.save
  end

  def roomDecrement
    location = Location.find_by_id(location_id)
    if location.present?
      location.total_rooms -= 1
      location.save
    end
  end
end
