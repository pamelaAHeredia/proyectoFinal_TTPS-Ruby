class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy edit_password update_password]
  before_action :authorize!, only: %i[index]

  def index
    if Current.user.has_role? :bank_staff
      @users = User.with_role(:client)
    elsif Current.user.has_role? :admin
      @users = User.all
    end
  end

  def show
    authorize! @user
  end

  def edit
    authorize! @user
  end

  def update
    authorize! @user
    @user.username = user_params[:username]
    @user.email = user_params[:email]
    @user.branch_id = user_params[:branch_id]
    if @user.save
      @user.update_role(user_params[:roles])
      redirect_to @user, notice: 'Usuario actualizado!'
    else
      # redirect_to edit_user_path(@user), alert: 'No se pudo actualizar el usuario.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @user
    if @user.id != 1
      @user.destroy
      return redirect_to users_path, notice: 'El usuario ha sido eliminado.'
    end
    redirect_to users_path, alert: 'No es posible eliminar al administrador.'
  end

  def edit_password
    authorize! @user
  end

  def update_password
    authorize! @user
    if @user.authenticate(password_params[:password])
      unless password_params[:confirm_password] == password_params[:new_password]
        return redirect_to :edit_password, alert: 'Las contraseñas ingresadas no coinciden.'
      end

      @user.password = password_params[:new_password]
      return redirect_to :edit_password, notice: 'Contraseña actualizada!' if @user.save

      render :edit_password, alert: 'No se pudo actualizar la contraseña.', status: :unprocessable_entity

    end
    redirect_to :edit_password, alert: 'Contraseña incorrecta'
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:username, :email, :roles, :branch_id)
  end

  def password_params
    params.require(:user).permit(:password, :new_password, :confirm_password)
  end
end
