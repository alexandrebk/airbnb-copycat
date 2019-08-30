class ReviewsController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.flat = @flat
    @review.booking = @booking
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
