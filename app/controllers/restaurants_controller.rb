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
        @restaurant = Restaurant.find(params[:id])
        @reviews = @restaurant.reviews
    end


end
