class ReviewsController < ApplicationController


    def create
        review_params = params.require(:review).permit(:comment, :restaurant_id)
        review_params[:user_id] = @current_user.id
        @review = Review.create(review_params)
        redirect_to @review.restaurant
    end

end
