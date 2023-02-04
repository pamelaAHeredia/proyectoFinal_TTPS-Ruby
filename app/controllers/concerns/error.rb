module Error
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      redirect_to home_index_path, alert: 'ups... no se encontró la ruta que que estás buscando.'
    end

    rescue_from ActiveRecord::RecordNotUnique do
      redirect_to home_index_path, alert: 'Ya existe, debes crear uno difrente.'
    end

    rescue_from ActiveRecord::DeleteRestrictionError do
      redirect_to home_index_path, alert: 'No es posible eliminar esta entidad, tiene dependencias.'
    end
  end
  
end
