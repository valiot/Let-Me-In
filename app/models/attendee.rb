class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :email_is_unique_today

  private
  def email_is_unique_today
    if Attendee.where(user: user).where('created_at > (?)', Time.zone.today.beginning_of_day).count > 0
      errors.add(:email, 'Correo ya registrado')
    end
  end

end
