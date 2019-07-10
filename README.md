# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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
