class ReviewsController < ApplicationController

  def create
    @review         = Review.new(review_params)
    @booking        = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user    = current_user
    @flat           = @review.booking.flat
    if @review.save
      redirect_to flat_path(@flat.id)
    else
      render "bookings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
