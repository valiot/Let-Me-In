class DynamicField < ApplicationRecord
  belongs_to :event
  belongs_to :custom_field
  belongs_to :user, optional: true
end
