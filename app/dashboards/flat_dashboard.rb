require "administrate/base_dashboard"

class FlatDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    bookings: Field::HasMany,
    id: Field::Number,
    address: Field::String,
    surface: Field::Number,
    price: Field::Number,
    room: Field::Number,
    description: Field::Text,
    max_guests: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    photo: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :bookings,
    :id,
    :address,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :bookings,
    :id,
    :address,
    :surface,
    :price,
    :room,
    :description,
    :max_guests,
    :created_at,
    :updated_at,
    :latitude,
    :longitude,
    :photo,
  ].freeze

  FORM_ATTRIBUTES = [
    :user,
    :bookings,
    :address,
    :surface,
    :price,
    :room,
    :description,
    :max_guests,
    :latitude,
    :longitude,
    :photo,
  ].freeze

  def display_resource(flat)
    "#{flat.address}"
  end
end
