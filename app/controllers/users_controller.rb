class UsersController < ApplicationController
    #callback para evitar duplicar 
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show 
    end

    def edit 
    end

    def update
       @user.update user_params
       return redirect_to @user
    end

    def destroy   
        @user.destroy
        return redirect_to users_path
    end 

    private 

    def set_user 
        @user = User.find params[:id]
    end

    def user_params
        params.require(:user).permit(:username, :email, :roles)
    end

end
