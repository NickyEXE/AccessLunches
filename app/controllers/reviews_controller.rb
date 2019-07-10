class ReviewsController < ApplicationController

    def comment
        strong_params = params.require(:review).permit(:comment)
        strong_params[:user_id] = @current_user.id
        strong_params[:restaurant_id] = params[:id]
        Review.create(strong_params)
        redirect_to Restaurant.find(params[:id])
    end

end
