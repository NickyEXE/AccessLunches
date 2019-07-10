class AuthController < ApplicationController

    def new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        flash[:errors] = ["Logging in #{@user.username}."]
        session[:user_id] = @user.id
        redirect_to restaurants_path
      else
        flash[:errors] = ["Invalid Username or Password."]
        redirect_to "/login"
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to "/login"
    end
  
end
