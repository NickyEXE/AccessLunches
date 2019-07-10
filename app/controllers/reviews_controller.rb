class ReviewsController < ApplicationController

    def create
        review_params = params.require(:review).permit(:comment, :restaurant_id)
        review_params[:user_id] = @current_user.id
        Review.create(review_params)
        redirect_to Restaurant.find_by(params[:restaurant_id])
    end


end
