class SchedulePolicy < BasePolicy
  def method_missing(m, *args, &block)
    Current.user.has_role? :admin
  end
end