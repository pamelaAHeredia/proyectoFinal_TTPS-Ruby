class AppointmentPolicy < BasePolicy
  def edit
    record.owner? || Current.user.admin?
  end

  def update
    record.owner? || Current.user.admin?
  end

  def destroy
    record.owner? || Current.user.admin?
  end

  def attend
    !Current.user.customer?
  end

  def edit_attention
    !Current.user.customer?
  end

  def new
    !Current.user.bank_staff?
  end

  def create
    !Current.user.bank_staff?
  end
end
