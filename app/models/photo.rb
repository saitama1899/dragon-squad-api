class Photo < ApplicationRecord
  belongs_to :room
  validates_presence_of :url
end
