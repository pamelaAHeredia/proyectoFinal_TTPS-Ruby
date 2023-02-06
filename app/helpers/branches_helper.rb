module BranchesHelper
  def available_branches
    Branch.all.select { |b| b.available? }
  end

end
