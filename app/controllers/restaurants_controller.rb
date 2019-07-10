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



end
