require 'rails_helper'

RSpec.describe Booking, type: :model do
  before(:all) do
    @user = User.create(email: "test@gmail.com", password: "azerty")
    @flat = Flat.create(
      address:     "55 Rue du Faubourg Saint-Honoré, 75008 Paris",
      description: "Palais magnifique",
      surface:     300,
      price:       1000,
      room:        20,
      max_guests:  40,
      user:        @user,
    )
    @booking = Booking.new
    @booking.validate
  end

  context "validation" do
    it "should validate presence of user" do
      expect(@booking.errors.messages).to include(:user)
      expect(@booking.valid?).to be false
    end
  end
end
