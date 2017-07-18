class User < ApplicationRecord
  attr_accessor :login

  has_many :dynamic_fields
  has_many :attendees
  has_many :events, through: :attendees
  validates_uniqueness_of :email
  validates_presence_of :name

  before_create :update_fields

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  def update_fields
    self.name = self.name.titleize
    self.email.downcase!
  end

  def event_count(event)
    attendees.where(event: event).count
  end
end
