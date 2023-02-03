class Auth::SessionsController < ApplicationController
  skip_before_action :protect_pages

  def new; end

  def create
    @user = User.find_by('username = :username', { username: params[:username] })

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_index_path, notice: 'Sesión iniciada!'
    else
      redirect_to new_session_path, alert: 'Usuario o contraseña incorrecta..'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'Sesión finalizada!'
  end
end
