class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews


    def self.get_all_restaurants_from_yelp
        url = "https://api.yelp.com/v3/businesses/search"
        params = {
              term: "lunch",
              latitude: 40.700862,
              longitude: -73.9896607,
              limit: 50,
              radius: 500
            }
          
            response = HTTP.auth("Bearer #{ENV["API_KEY"]}").get(url, params: params)
            response.parse["businesses"].each do |business|
                self.create_new_restaurant_from_business_hash(business)
            end            
    end

    def self.create_new_restaurant_from_business_hash(business)
        Restaurant.create(name: business["name"], url: business["url"], lat: business["coordinates"]["latitude"], long: business["coordinates"]["longitude"], image_url: business["image_url"], address: business["location"]["address1"], kind_of_food: business["categories"][0]["title"])
    end

end
