require 'administrate/base_dashboard'

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    attendees: Field::HasMany,
    custom_fields: Field::HasMany,
    last_attendees: Field::Number,
    id: Field::Number,
    name: Field::String,
    boletia_id: Field::Number,
    pre_register: Field::Boolean,
    starts_at: Field::DateTime,
    finishes_at: Field::DateTime,
    label_xml: FileField,
    image: Field::Refile,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :attendees,
    :last_attendees
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :attendees,
    :custom_fields,
    :id,
    :name,
    :starts_at,
    :finishes_at,
    :pre_register,
    :image,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :custom_fields,
    :pre_register,
    :starts_at,
    :finishes_at,
    :label_xml,
    :image,
    :boletia_id
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(event)
    event.name
  end
end
