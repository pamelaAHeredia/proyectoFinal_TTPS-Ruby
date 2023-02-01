class AppointmentPolicy < BasePolicy
  def edit
    record.owner? || Current.user.has_role?(:admin)
  end

  def update
    record.owner? || Current.user.has_role?(:admin)
  end

  def destroy
    record.owner? || Current.user.has_role?(:admin)
  end

  def attended
    !Current.user.has_role?(:client) 
    # Y la sucursal tiene que coincidir con la del current
  end

  def edit_attention
    !Current.user.has_role?(:client) 
    # Y la sucursal tiene que coincidir con la del current
  end

  def new
    !Current.user.has_role?(:bank_staff)
  end

  def create
    !Current.user.has_role?(:bank_staff)
  end

end
