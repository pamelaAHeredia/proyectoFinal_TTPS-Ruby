class Auth::UsersController < ApplicationController
    skip_before_action :protect_pages

    def new
        @user = User.new
    end

    def create 
        # sobreescribit el rol
        render plain: params[:user].inspect
        @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            return redirect_to users_path 
        end

        render :new, status: :unprocessable_entity
    end

    private 

    #paràmetros fuertes
    def user_params
        params.require(:user).permit(:username, :email, :password, :role)
    end


end
