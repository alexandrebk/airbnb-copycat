class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    if @review.save
      redirect_to booking_path(@booking)
    else
      render "bookings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
