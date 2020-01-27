class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :location
  validates_presence_of :title, length: { in: 6..30 }
  validates_presence_of :description, length: { maximum: 300 }
  validates_presence_of :price, numericality: true, greater_than: 0
end
