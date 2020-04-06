class Flat < ApplicationRecord
  include PgSearch::Model
    pg_search_scope :search_by_description_and_address,
      against: [ :description, :address ],
      using: {
        tsearch: { prefix: true }
      }

  belongs_to :user
  has_many   :bookings, dependent: :destroy
  has_many_attached :images

  validates :address,     presence: true
  validates :surface,     presence: true, numericality: { only_integer: true }
  validates :price,       presence: true, numericality: { only_integer: true }
  validates :room,        presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :max_guests,  presence: true, numericality: { only_integer: true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  def is_available?(start_date, end_date)
    bookings.each do |b|
      return false if (b.start_date..b.end_date).overlaps?(start_date.to_date..end_date.to_date)
    end
    return true
  end
end
