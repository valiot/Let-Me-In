class User < ApplicationRecord
  has_many :attendees
  has_many :events, through: :attendees

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  def self.from_omniauth(auth, event)
    existing_user = User.find_by(email: auth.info.email)
    return existing_user if existing_user
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.attendees.build(event: event)
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.save!
    end
  end

  def event_count(event)
    attendees.where(event: event).count
  end
end
