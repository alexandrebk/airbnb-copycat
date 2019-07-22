require "administrate/base_dashboard"

class BookingDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    flat: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :flat,
    :user,
    :id,
    :start_date,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :flat,
    :user,
    :id,
    :start_date,
    :end_date,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :flat,
    :user,
    :start_date,
    :end_date,
  ].freeze
end
