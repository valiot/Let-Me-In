class Event < ApplicationRecord
  before_create :generate_slug
  has_many :attendees

  attachment :image

  def to_param
    slug
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by(slug: input)
    end
  end

  def print_attendees
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
    attendees.each do |attendee|
      next if attendee.user.nil?
      puts "#{attendee.user.name},#{attendee.user.email}"
    end
    ActiveRecord::Base.logger = old_logger
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
