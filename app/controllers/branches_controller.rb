class BranchesController < ApplicationController
  before_action :set_branch, only: %i[show edit update destroy]
  before_action :localities, only: %i[new create update edit]
  before_action :schedule_days, only: %i[show index]
  before_action :authorize!

  def index
    @branches = Branch.all
  end

  def new
    @branch = Branch.new;
  end

  def create
    @branch = Branch.new branch_params
    return redirect_to branches_path, notice: 'Sucursal creada con éxito.' if @branch.save

    redirect_to branches_path, alert: 'No se pudo crear la sucursal.'
  end

  def show; end

  def edit; end

  def update
    return redirect_to branch_path, notice: 'La sucursal ha sido actualizada' if @branch.update branch_params

    redirect_to edit_branch_path, alert: 'No se pudo actualizar la sucursal'
  end

  def destroy
    if @branch.pending_appointments?
      redirect_to branches_path, alert: 'No se puede eliminar una sucursal con turnos pendientes de atención.'
    else
      @branch.destroy
      redirect_to branches_path, notice: 'Sucursal eliminada'
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :address, :telephone, :locality_id)
  end

  def set_branch
    @branch = Branch.find params[:id]
  end

  def localities
    @localities = Locality.all
  end

  def schedule_days
    @schedule_days = Schedule.days
  end
end
