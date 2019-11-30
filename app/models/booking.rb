class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date,   presence: true

  def total_nights
    (end_date - start_date).to_i
  end

  def total_price
    total_nights * flat.price
  end
end
