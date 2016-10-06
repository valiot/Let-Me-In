class CustomField < ApplicationRecord
  self.inheritance_column = 'inheritance_type'
  has_many :dynamic_fields
  enum type: [:text_field, :select_field]
end
