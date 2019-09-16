require 'rails_helper'

RSpec.describe Flat, type: :model do

  before(:all) do
    @flat = Flat.new
    @user = User.create(email: "test@gmail.com", password: "azerty")
    @flat.validate
  end

  context "validation" do
    it "should validate presence of address" do
      expect(@flat.errors.messages).to include(:address)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of description" do
      expect(@flat.errors.messages).to include(:description)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of surface" do
      expect(@flat.errors.messages).to include(:surface)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of price" do
      expect(@flat.errors.messages).to include(:price)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of room" do
      expect(@flat.errors.messages).to include(:room)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of max guest" do
      expect(@flat.errors.messages).to include(:max_guests)
      expect(@flat.valid?).to be false
    end
    it "should validate presence of user" do
      expect(@flat.errors.messages).to include(:user)
      expect(@flat.valid?).to be false
    end
    it "should save when all valid fields are present" do
      @flat.address     = "55 Rue du Faubourg Saint-Honoré, 75008 Paris"
      @flat.description = "Palais magnifique"
      @flat.surface     = 300
      @flat.price       = 1000
      @flat.room        = 20
      @flat.max_guests  = 40
      @flat.user        = @user
      expect(@flat.valid?).to be true
    end
  end

  context ".search" do
    it "should find my flat when search Paris" do
      expect(Flat.search_by_description_and_address("Paris").count).to be > 0
    end
    it "should not find my flat when search Lyon" do
      expect(Flat.search_by_description_and_address("Lyon").count).to be 0
    end
  end
end
