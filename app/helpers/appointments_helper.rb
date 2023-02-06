module AppointmentsHelper
    def get_statuses
        {'Atendidos' => :attended, 
        'Pendientes' => :pending, 
        'Todos' => :all }
    end

    def all_statuses 
        Appointment.statuses
    end
end
