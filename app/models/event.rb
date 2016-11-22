class Event < ApplicationRecord
  before_create :generate_slug
  has_many :attendees
  has_many :dynamic_fields
  has_many :custom_fields, through: :dynamic_fields

  attachment :image

  # Virtual attribute for form_for
  def event_downloaded_at
    Time.zone.now.yesterday
  end

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
    csv = ''
    attendees.where('created_at >= ? AND created_at <= ?', date.beginning_of_day, date.end_of_day).each do |attendee|
      next if attendee.user.nil?
      csv << "#{attendee.user.name},#{attendee.user.email},#{dynamic_fields&.where(user: attendee.user).map(&:value)&.join(',')}\n"
    end
    csv
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
