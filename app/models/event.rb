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

  def print_attendees(date)
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
    attendees.where('created_at >= ? AND created_at <= ?', Time.zone.beginning_of_day, Time.zone.end_of_day).each do |attendee|
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
