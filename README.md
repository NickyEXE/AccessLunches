# README

WE WILL BE BUILDING A RAILS APP TO REVIEW THE LUNCH SPOTS BY ACCESS LABS

This app currently has:
  >An Auth Model
  >A User and Restaurant class
  >Bootstrap and some custom CSS
  >A few show views

It needs:
  >Data from Yelp
  >Routing
  >Controller Actions
  >The ability to create a user
  >A Reviews model and active record relations
  >The ability to add a review
  


* ...














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


















<h3 class="custom-form-card">
<%= form_for :review, url: comment_path, :html => {:class => "form-horizontal center"} do |f| %>
    <%= f.label :comment, "", class: "col-md-4 control-label" %>
    <%= f.text_area :comment, class: "form-control" %>
    <%= f.hidden_field :restaurant_id, :value => @restaurant.id %>
    <%= f.submit "Post", class: "btn btn-default btn-danger" %>
<% end%>
</h3>


<% if @reviews%>
  <% @reviews.each do |review|%>
  <div class="username">
  <%= review.user.username %></div>
  <h6 class="custom-post-card">
  <%=review.comment%>
  </h6>
  <% end%>
<% end%>





