class RestaurantsController < ApplicationController
    before_action :authorized

    def index
        @restaurants = Restaurant.all.sort_by{|restaurant| restaurant.name}
    end

    def show
        @restaurant = Restaurant.find_by(id: params[:id])
        @reviews = @restaurant.reviews
        @review = Review.new()
    end


    def find
        redirect_to Restaurant.find_by(id: params[:restaurant][:restaurant_id])
    end



end
