class AppointmentPolicy < BasePolicy
  def edit
    record.owner?
  end

  def index 
    !Current.user.admin?
  end

  def filter
    !Current.user.admin?
  end

  def show
    (Current.user.bank_staff? && record.branch?) || record.owner?
  end

  def update
    record.owner?
  end

  def destroy
    record.owner?
  end

  def attend
    Current.user.bank_staff? && record.branch?
  end

  def edit_attention
    Current.user.bank_staff? && record.branch?
  end

  def new
    Current.user.customer?
  end

  def create
    Current.user.customer?
  end
end
