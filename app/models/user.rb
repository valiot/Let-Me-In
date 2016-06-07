class User < ApplicationRecord
  attr_accessor :login

  has_many :attendees
  has_many :events, through: :attendees
  validates_uniqueness_of :email
  validates_presence_of :name

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  def event_count(event)
    attendees.where(event: event).count
  end
end
