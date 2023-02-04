class LocalitiesController < ApplicationController
  before_action :set_locality, only: %i[show edit update destroy]
  before_action :provinces, only: %i[index show]
  before_action :authorize!

  def index
    @localities = Locality.all
  end

  def new
    @locality = Locality.new
  end

  def create
    @locality = Locality.new locality_params
    return redirect_to localities_path, notice: 'La localidad ha sido creada' if @locality.save

    redirect_to localities_path, alert: 'No se pudo crear la localidad'
  end

  def show; end

  def edit; end

  def update
    return redirect_to @locality, notice: 'La localidad ha sido actualizada' if @locality.update locality_params

    redirect_to edit_locality_path, alert: 'No se pudo actualizar la localidad'
  end

  def destroy
    # si no tiene sucursales asociadas
    @locality.destroy
    redirect_to localities_path
  end

  private

  def locality_params
    params.require(:locality).permit(:name, :province)
  end

  def set_locality
    @locality = Locality.find params[:id]
  end
  
  def provinces
    @provinces = Locality.provinces
  end
end
