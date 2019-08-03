class BookingsController < ApplicationController
  before_action :set_flat, only: [:create, :show]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params.merge(user: current_user))
    @booking.flat = @flat
    if @booking.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @nb_nights = (@booking.end_date - @booking.start_date).to_i
    @total_price = (@nb_nights * @booking.flat.price)
    @markers     = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
