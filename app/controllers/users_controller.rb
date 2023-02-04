class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy edit_password update_password]
  before_action :authorize!, only: %i[index]

  def index
    if Current.user.bank_staff?
      @users = User.with_role(:customer)
    elsif Current.user.admin?
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
    if @user.id != 1
      @user.username = user_params[:username]
      @user.email = user_params[:email]
      if user_params[:roles] == 'bank_staff'
        @user.branch_id = user_params[:branch_id]
      else
        @user.branch_id = nil
      end
      if @user.save
        @user.update_role(user_params[:roles])
        redirect_to @user, notice: 'Usuario actualizado!'
      else
        render :edit, status: :unprocessable_entity
      end
    else 
      redirect_to @user, notice: 'No es posible modificar los datos de este administrador.'
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

  def search
    @user = User.where(username: user_params[:username])
    p @user.ids 
    if @user != []
      return redirect_to ({ action: "show", id: @user.ids })
    else
      redirect_to users_path, alert: 'usuario no encontrado'
    end
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
