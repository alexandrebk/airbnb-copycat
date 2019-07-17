class Flat < ApplicationRecord
  belongs_to :user
  has_many   :bookings, dependent: :destroy

  validates :address, presence: true
  validates :surface, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :room, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :max_guests, presence: true, numericality: { only_integer: true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
