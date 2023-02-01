class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy attended edit_attention]
  before_action :authorize! , only: %i[new create edit_attention attended destroy]

  def index
    if Current.user.has_role? :client
      @appointments = Appointment.where(user_id: Current.user.id)
    elsif Current.user.has_role? :bank_staff
      @appointments = Appointment.where(branch_id: Current.user.branch_id)
    else
      @appointments = Appointment.all
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    # Poner el estado como pendiente
    @appointment = Appointment.new appointment_params
    @appointment.status = :pending
    return redirect_to appointments_path, notice: 'Turno creado con éxito.' if @appointment.save

    redirect_to appointments_path, alert: 'No se pudo crear el turno.'
  end

  def show; end

  def edit
    authorize! @appointment
  end

  def update
    authorize! @appointment
    # si está en estado pendiente Y la fecha es posterior a hoy
    if @appointment.pending? 
      if @appointment.update appointment_params
        return redirect_to appointment_path,
                          notice: 'El turno ha sido actualizado'
      end
    end
    redirect_to edit_appointment_path, alert: 'No se pudo modificar el turno.'
  end

  def destroy
    authorize! @appointment
    if @appointment.pending?
      @appointment.destroy
      return redirect_to appointments_path, notice: 'Turno eliminado'
    end
    redirect_to appointments_path, alert: 'No se puede cancelar un turno atendido'
  end

  def edit_attention
    authorize! @appointment
  end
  
  def attended
    authorize! @appointment
    @appointment.status = :attended
    @appointment.comment = attention_params[:comment]
    @appointment.personnel_id = params.require(:personnel_id)
    if @appointment.save
        return redirect_to appointments_path,
                           notice: 'El turno ha sido atentido.'
    end
    redirect_to appointments_path, alert: 'No se pudo registrar el turno'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :user_id, :branch_id, :motive)
  end

  def attention_params
    params.require(:appointment).permit(:comment)
  end

  def set_appointment
    @appointment = Appointment.find params[:id]
  end

end
