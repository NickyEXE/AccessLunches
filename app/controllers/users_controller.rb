class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create
        @user = User.create(strong_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to restaurants_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end


    private

    def strong_params
        params.require(:user).permit(:username, :password)
    end


end
