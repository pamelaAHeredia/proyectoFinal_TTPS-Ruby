module BranchesHelper
  def available_branches
    Branch.all.select { |b| b.available? }
  end

  def all_branches
    Branch.all.order(name: :asc)
  end
end
