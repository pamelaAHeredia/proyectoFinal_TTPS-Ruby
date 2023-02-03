class UserPolicy < BasePolicy
  def method_missing(_m, *_args)
    Current.user.admin?
  end

  def new
    if Current.user
      return !Current.user.bank_staff?
    end
    true
  end

  def create
    !Current.user.bank_staff?
  end

  def show
    record.owner? || (record.customer? && !Current.user.customer?) || Current.user.admin?
  end

  def edit
    record.owner? || Current.user.admin?
  end

  def update
    record.owner? || Current.user.admin?
  end

  def edit_password
    record.owner? || Current.admin?
  end

  def update_password
    record.owner? || Current.admin?
  end

  def index
    !Current.user.customer?
  end
end
