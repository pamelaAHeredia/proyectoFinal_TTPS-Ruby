class Appointment < ApplicationRecord
  validates :date, :time, :motive, presence: true
  # validate :date_time_check

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
