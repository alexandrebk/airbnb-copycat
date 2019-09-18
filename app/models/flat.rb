class Flat < ApplicationRecord
  include PgSearch::Model
    pg_search_scope :search_by_description_and_address,
      against: [ :description, :address ],
      using: {
        tsearch: { prefix: true }
      }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
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

  def average
    # self.reviews.average(:rating)
    self.reviews.sum(&:rating) / self.reviews.size
  end
end
