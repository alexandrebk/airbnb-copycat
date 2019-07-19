class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @flats    = current_user.flats
    @bookings = current_user.bookings
  end

end
