class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews


    def cheese
        puts "cheese"
    end
    def self.get_restaurants_from_yelp
        url = "https://api.yelp.com/v3/businesses/search"
        params = {
          term: "lunch",
          latitude: 40.700862,
          longitude: -73.987472,
          limit: 50,
          radius: 500
        }
        response = HTTP.auth("Bearer #{ENV["API_KEY"]}").get(url, params: params)
        response.parse
        response.parse["businesses"].each do |business|
            Restaurant.create_restaurant_from_yelp_business(business)
        end
    end


    def self.create_restaurant_from_yelp_business(business)
        Restaurant.create(name: business["name"], url: business["url"], image_url: business["image_url"], lat: business["coordinates"]["latitude"], long: business["coordinates"]["longitude"], address: business["location"]["address1"], kind_of_food: business["categories"][0]["title"])
    end

end
