class ReviewsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = current_user
    @review = Review.new(params_review)
    @review.event = @event
    @review.user = @user
    @review.save!
    redirect_to event_path(@event)
    flash[:alert] = "Your review has been published."
  end

  def destroy
    @review.destroy
  end


  private

  def params_review
    params.require(:review).permit(:comment, :rating)
  end

end
