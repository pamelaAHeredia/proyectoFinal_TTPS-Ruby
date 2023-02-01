class UserPolicy < BasePolicy
  def method_missing(_m, *_args)
    Current.user.has_role? :admin
  end

  def new
    if Current.user
      return !Current.user.has_role?(:bank_staff)
    end
    true
  end

  def create
    !Current.user.has_role? :bank_staff
  end

  def show
    record.owner? || Current.user.has_role?(:admin)
  end

  def edit
    record.owner? || Current.user.has_role?(:admin)
  end

  def update
    record.owner? || Current.user.has_role?(:admin)
  end

  def edit_password
    record.owner?
  end

  def update_password
    record.owner?
  end

  def index
    !Current.user.has_role?(:client)
  end
end
