class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]
  before_action :authorize!
  
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @branch = Branch.find(params[:branch_id])
    @schedule = @branch.schedules.create schedule_params
    return redirect_to branch_path(@branch) if @schedule.save

    redirect_to branches_path, alert: 'No se pudo crear el horario.'
  end

  def show; end

  def edit; end

  def update
    @branch = Branch.find(params[:branch_id])
    return redirect_to @branch, notice: 'El horario ha sido actualizado.' if @schedule.update schedule_params

    redirect_to edit_schedule_path, alert: 'No se pudo actualizar el horario.'
  end

  def destroy
    @branch = Branch.find(@schedule.branch.id)
    @schedule.destroy
    redirect_to @branch, notice: 'Horario eliminado.'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :start_time, :end_time, :branch_id)
  end

  def set_schedule
    @schedule = Schedule.find params[:id]
  end
end
