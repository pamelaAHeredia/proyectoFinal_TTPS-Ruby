module SchedulesHelper
    
  def get_available_days
    { 'Lunes' => :monday,
      'Martes' => :tuesday,
      'Miércoles' => :wednesday,
      'Jueves' => :thursday,
      'Viernes' => :friday,
      'Sábado' => :saturday,
      'Domingo' => :sunday }
  end

  def all_days 
    Schedule.days
  end
end
