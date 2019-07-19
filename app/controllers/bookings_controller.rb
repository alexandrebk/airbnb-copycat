class BookingsController < ApplicationController
  before_action :set_flat, only: [:new, :create, :show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.merge(user: current_user))
    @booking.flat = @flat
    if @booking.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
