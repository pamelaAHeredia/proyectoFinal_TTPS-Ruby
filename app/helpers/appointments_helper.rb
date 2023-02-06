module AppointmentsHelper
    def get_statuses
        {'Atendidos' => :attended, 
        'Pendientes' => :pending, 
        'Todos' => :all }
    end
end
