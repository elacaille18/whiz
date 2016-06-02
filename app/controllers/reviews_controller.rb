class ReviewsController < ApplicationController
  before_action :find_mission, only: [:new, :create]

  def new
    if @mission.trip
      @review = Review.new()
      authorize @review
    else
      redirect_to root_path
    end
  end

  def create
   @review = Review.new(review_params)
   @review.mission = @mission
   @review.user = current_user
   authorize @review

   if @review.save
     # @user = @mission.trip.user
     # @trip.average_rating = @trip.reviews.map(&:rating).reduce(:+).fdiv(@trip.reviews.count).to_i
     # @trip.save
     redirect_to root_path
   else
     render :new
   end
  end


  private

  def find_mission
    @mission = Mission.find(params[:mission_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
