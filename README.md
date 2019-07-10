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
























<h3 class="custom-form-card">
<%= form_for @review, :html => {:class => "form-horizontal center"} do |f| %>
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
