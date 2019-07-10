class Restaurant < ApplicationRecord

    has_many :reviews
    has_many :restaurants, through: :reviews




    # Called on seeding only

    def self.get_restaurants_from_yelp
        url = "https://api.yelp.com/v3/businesses/search"
        params = {
            latitude: 40.700866,
            longitude: -73.989666,
            limit: 50,
            term: "lunch",
            radius: 500
        }
        response = HTTP.auth("Bearer #{ENV['API_KEY']}").get(url, params: params)
        businesses = response.parse["businesses"]
        businesses.each do |business|
            self.create_business_from_yelp_data(business)
        end
    end

    def self.create_business_from_yelp_data(business)
        Restaurant.create(name: business["name"], url: business["url"], image_url: business["image_url"], lat: business["coordinates"]["latitude"], long: business["coordinates"]["longitude"], address: business["location"]["address1"], kind_of_food: business["categories"][0]["title"])
    end

end
