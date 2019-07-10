class RestaurantsController < ApplicationController
    before_action :authorized


    def find
        @restaurant = Restaurant.find(params[:restaurant][:id])
        redirect_to @restaurant
    end

    def index
        @restaurants = Restaurant.all.sort_by{|restaurant| restaurant.name}
    end

    def show
        @review = Review.new()
        find_restaurant
        @reviews = @restaurant.reviews
    end

    private

    def find_restaurant
        @restaurant = Restaurant.find(params[:id])
    end


end
