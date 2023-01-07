class Auth::UsersController < ApplicationController
    skip_before_action :protect_pages

    def new
        @user = User.new
    end

    def create 
        user = User.new do |u|
            u.username = user_params[:username]
            u.email = user_params[:email]
            u.password = user_params[:password]
        end

        role = user_params[:roles]
        user.assign_role(role)

        @user = user
        if @user.save
            redirect_to users_path
            return
        end

        render :new, status: :unprocessable_entity
    end

    private 

    #paràmetros fuertes
    def user_params
        params.require(:user).permit(:username, :email, :password, :roles)
    end

end
