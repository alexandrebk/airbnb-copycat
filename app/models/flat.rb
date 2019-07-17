class Flat < ApplicationRecord
  include PgSearch
    pg_search_scope :search_by_description_and_address,
      against: [ :description, :address ],
      using: {
        tsearch: { prefix: true }
      }

  belongs_to :user
  has_many   :bookings, dependent: :destroy
end
