require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    flats: Field::HasMany,
    bookings: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :flats,
    :bookings,
    :id,
    :email,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :flats,
    :bookings,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :first_name,
    :last_name,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :flats,
    :bookings,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :first_name,
    :last_name,
  ].freeze

  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end
