class Event < ApplicationRecord
  has_many :attendees

  attachment :image
end
