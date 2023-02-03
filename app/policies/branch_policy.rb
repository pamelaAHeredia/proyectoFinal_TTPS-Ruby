class BranchPolicy < BasePolicy

  def method_missing(m, *args, &block)
    Current.user.admin?
  end

  def index 
    !Current.user.customer?
  end

  def show
    !Current.user.customer?
  end
end