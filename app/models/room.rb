class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :location
  validates_presence_of :title, length: { in: 6..30 }
  validates_presence_of :description, length: { maximum: 300 }
  validates_presence_of :price, numericality: true, greater_than: 0
  class Room < ApplicationRecord
    has_many :photos, dependent: :destroy
    belongs_to :location
    validates_presence_of :title, length: { in: 6..30 }
    validates_presence_of :description, length: { maximum: 300 }
    validates_presence_of :price, numericality: true, greater_than: 0
    after_create :roomIncrement

    #callbacks
    private
      def roomIncrement
        location=Location.find_by_id(self.location_id)
        location.total_rooms += 1
        location.save

      end
      def roomDecrement
        location=Location.find_by_id(self.location_id)
        location.total_rooms -= 1
        location.save
      end

  end

end
