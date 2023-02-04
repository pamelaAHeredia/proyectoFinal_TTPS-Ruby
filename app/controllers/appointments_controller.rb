class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy attend edit_attention]
  before_action :authorize!, only: %i[new create edit_attention]
  before_action :statuses, only: %i[show index filter]
  before_action :branches, :days, only: %i[new edit]

  def index
    @appointments = if Current.user.customer?
                      Appointment.where(user_id: Current.user.id)
                    elsif Current.user.bank_staff?
                      Appointment.where(branch_id: Current.user.branch_id)
                    else
                      Appointment.all
                    end
  end
  
  def filter
    status = appointment_params[:status]
    if status == 'all'
      @appointments = if Current.user.customer?
                        Appointment.where(user_id: Current.user.id)
                      elsif Current.user.bank_staff?
                        Appointment.where(branch_id: Current.user.branch_id)
                      else
                        Appointment.all
                      end
    else
      @appointments = if Current.user.customer?
                        Appointment.where(user_id: Current.user.id, status: status)
                      elsif Current.user.bank_staff?
                        Appointment.where(branch_id: Current.user.branch_id, status: status)
                      else
                        Appointment.where(status: status)
                      end
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new appointment_params
    @appointment.status = :pending
    return redirect_to appointments_path, notice: 'Turno creado con éxito.' if @appointment.save

    redirect_to appointments_path(@appointments), alert: 'No se pudo crear el turno. Verifique que horario elegido e ingrese sólo letras y números.'
    # render :new, status: :unprocessable_entity
  end

  def show; end

  def edit
    authorize! @appointment
  end

  def update
    authorize! @appointment
    if @appointment.pending? && @appointment.available? && (@appointment.update appointment_params)
      return redirect_to appointment_path,
                         notice: 'El turno ha sido actualizado'
    end
    redirect_to edit_appointment_path, alert: 'No se pudo modificar el turno.'
  end

  def destroy
    authorize! @appointment
    if @appointment.pending? && @appointment.available? || Current.user.admin?
      @appointment.destroy
      return redirect_to appointments_path, notice: 'Turno Cancelado.'
    end
    redirect_to appointments_path, alert: 'No se puede cancelar.'
  end

  def edit_attention
    authorize! @appointment
  end

  def attend
    authorize! @appointment
    @appointment.status = :attended
    @appointment.comment = appointment_params[:comment]
    @appointment.personnel_id = params.require(:personnel_id)
    if @appointment.save
      return redirect_to appointments_path,
                         notice: 'El turno ha sido atentido.'
    end
    redirect_to appointments_path, alert: 'No se pudo registrar el turno'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :user_id, :branch_id, :motive, :comment, :status)
  end

  def set_appointment
    @appointment = Appointment.find params[:id]
  end

  def statuses
    @statuses = Appointment.statuses
  end

  def branches
    @branches = Branch.all
  end

  def days
    @days = Schedule.days
  end
end
