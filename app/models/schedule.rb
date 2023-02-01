class Schedule < ApplicationRecord
  belongs_to :branch
  validates :day, presence: true, length: { in: 5..9 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :start_finish_check

  def start_finish_check
    start = start_time.strftime('%H:%M:%S')
    finish = end_time.strftime('%H:%M:%S')
    return unless start > finish

    errors.add(:end_time,
               'Seleccione una hora de fin mayor a la hora de inicio.')
  end

  enum :day,
       monday: 'Lunes',
       tuesday: 'Martes',
       wednesday: 'Miércoles',
       thursday: 'Jueves',
       friday: 'Viernes',
       saturday: 'Sábado',
       sunday: 'Domingo'
end
