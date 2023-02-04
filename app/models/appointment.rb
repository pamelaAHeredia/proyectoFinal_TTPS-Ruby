class Appointment < ApplicationRecord
  validates :date, :time, presence: true
  validate :date_time_check

  validates :motive, presence: true,
                     format: {
                       with: /\A[a-z0-9A-Zñáéíóúü\s]+\z/,
                       message: "Ingrese sólo letras y números."
                     }

  belongs_to :user
  belongs_to :personnel, class_name: 'User', optional: true

  enum :status,
       pending: 'Pendiente',
       attended: 'Atendido'

  def pending?
    status == 'pending'
  end

  def owner?
    user_id == Current.user.id
  end

  def available?
    date > DateTime.now.to_date
  end

  def branch_name
    Branch.find_by_id(branch_id).name
  end

  def personnel_username
    User.find_by_id(personnel_id).username
  end

  def date_time_check
    hour = time.strftime('%H:%M:%S')

    schedules = Schedule.where(branch_id: branch_id)
    schedule = schedules.detect { |e| e.day == date.strftime('%A').downcase }

    if schedule && available? && (hour >= schedule.start_time.strftime('%H:%M:%S')) && (hour < schedule.end_time.strftime('%H:%M:%S'))
      return
    end

    errors.add(:date,
               'La sucursal no atiende en el horario seleccionado')
  end
end
