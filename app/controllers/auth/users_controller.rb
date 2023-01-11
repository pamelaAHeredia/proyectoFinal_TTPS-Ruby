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
      u.assign_role user_params[:roles]
    end

    @user = user
    return redirect_to users_path, notice: 'Usuario creado' if @user.save

    render :new, status: :unprocessable_entity
  end

  private

  # paràmetros fuertes
  def user_params
    params.require(:user).permit(:username, :email, :password, :roles)
  end
end
