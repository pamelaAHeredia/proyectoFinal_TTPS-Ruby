class BranchPolicy < BasePolicy

  def method_missing(m, *args, &block)
    Current.user.has_role? :admin
  end

  def index 
    !Current.user.has_role? :client
  end

  def show
    !Current.user.has_role? :client
  end
end