class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many   :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date,   presence: true

  def name
    self.flat.address
  end
end
