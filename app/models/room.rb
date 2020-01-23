class Room < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :description
    validates_presence_of :price
    validates_presence_of :lat
    validates_presence_of :lng
end
