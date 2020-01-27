class Location < ApplicationRecord
  has_many :rooms
  validates_presence_of :name
  validates_presence_of :lat, length:{ in: 40..41 } # Madrid
  validates_presence_of :lng, length:{ in: -3..-2 }
end
