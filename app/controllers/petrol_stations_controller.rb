class PetrolStationsController < ApplicationController
  before_action :set_petrol_station, only: %i[ show edit update destroy ]
  swagger_controller :petrol_stations, 'Petrol Stations'

  swagger_api :index do
    summary 'Returns all petrol stations'
    notes 'Notes...'
  end
  def index
    @petrol_stations = PetrolStation.all
  end

  swagger_api :show do
    summary 'Returns one petrol station'
    param :path, :id, :integer, :required, "Petrol Station id"
    notes 'Notes...'
  end
  def show
  end

  def new
    @petrol_station = PetrolStation.new
  end

  def edit
  end

  swagger_api :create do
    summary "Create a petrol station"
    param :form, "petrol_station[name]", :string, :required, "Petrol Station name"
    param :form, "petrol_station[address]", :string, :required, "Petrol Station address"
  end
  def create
    @petrol_station = PetrolStation.new(petrol_station_params)

    respond_to do |format|
      if @petrol_station.save
        format.html { redirect_to petrol_station_url(@petrol_station), notice: "Petrol station was successfully created." }
        format.json { render :show, status: :created, location: @petrol_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @petrol_station.errors, status: :unprocessable_entity }
      end
    end
  end


  swagger_api :update do
    summary "Update a petrol station"
    param :path, :id, :integer, :required, "Petrol Station id"
    param :form, "petrol_station[name]", :string, :required, "Petrol Station name"
    param :form, "petrol_station[address]", :string, :required, "Petrol Station address"
  end
  def update
    respond_to do |format|
      if @petrol_station.update(petrol_station_params)
        format.html { redirect_to petrol_station_url(@petrol_station), notice: "Petrol station was successfully updated." }
        format.json { render :show, status: :ok, location: @petrol_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @petrol_station.errors, status: :unprocessable_entity }
      end
    end
  end

  swagger_api :destroy do
    summary 'Destroys a petrol station'
    param :path, :id, :integer, :required, "Petrol Station id"
    notes 'Notes...'
  end
  def destroy
    @petrol_station.destroy

    respond_to do |format|
      format.html { redirect_to petrol_stations_url, notice: "Petrol station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_petrol_station
      @petrol_station = PetrolStation.find(params[:id])
    end

    def petrol_station_params
      params.require(:petrol_station).permit(:name, :address)
    end
end
