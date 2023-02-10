class Auth::UsersController < ApplicationController
  skip_before_action :protect_pages
  before_action :branches, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.new do |u|
      u.username = user_params[:username]
      u.email = user_params[:email]
      u.assign_role user_params[:roles]
      u.branch_id = user_params[:branch_id] unless user_params[:roles] != 'bank_staff'
      if user_params[:password].blank? 
        u.password = '123456'
      else 
        u.password = user_params[:password] 
      end
    end

    @user = user
    if @user.save
      if Current.user
        return redirect_to users_path, notice: 'Usuario creado'
      else
        return redirect_to new_session_path, notice: 'Usuario creado'
      end
    end
    render :new, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :roles, :branch_id)
  end

  def branches
    @branches = Branch.all.order(name: :asc)
  end

end
