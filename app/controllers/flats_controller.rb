class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    flats_filter = params[:flats_filter]
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    if flats_filter.present?
      if flats_filter[:search].present?
        @flats = Flat.search_by_description_and_address(flats_filter[:search])
      end
      if flats_filter[:min_price].present?
        @flats = @flats.where("flats.price >= ?", flats_filter[:min_price])
      end
      if flats_filter[:max_price].present?
        @flats = @flats.where("flats.price <= ?", flats_filter[:max_price])
      end
      if flats_filter[:start_date].present? || flats_filter[:end_date].present?
        @flats = @flats.select { |flat| flat.is_available?(flats_filter[:start_date],flats_filter[:end_date]) }
      end
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
    @booking        = Booking.new
    @bookings       = @flat.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
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
    params.require(:flat).permit(:address, :surface, :description, :price, :room, :max_guests, images: [])
  end
end
