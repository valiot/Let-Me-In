class Event < ApplicationRecord
  has_many :attendees

  attachment :image

  def to_param
    "#{id}-#{name}".parameterize
  end
end
