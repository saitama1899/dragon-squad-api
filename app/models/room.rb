class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates_presence_of :title, length: { in: 6..30 }
  validates_presence_of :description, length: { maximum: 300 }
  validates_presence_of :price, numericality: true, greater_than: 0
  validates_presence_of :lat, length:{ in: 40..42 } # Barcelona
  validates_presence_of :lng, length:{ in: 1..3 }
end
