class Identity < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6 }
end
