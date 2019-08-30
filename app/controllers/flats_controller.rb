class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @flats = Flat.search_by_description_and_address("%#{params[:query]}%")
    else
      @flats = Flat.where.not(latitude: nil, longitude: nil)
    end
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { flat: flat })
      }
    end
  end

  def show
    @reviews        = Review.all
    @booking        = Booking.new
    @bookings       = Booking.where(flat: @flat)
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params.merge(user: current_user))
    if @flat.save!
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to my_flat_path
  end

  def my_flat
    @flats = current_user.flats
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :surface, :description, :price, :room, :max_guests, :photo)
  end
end
