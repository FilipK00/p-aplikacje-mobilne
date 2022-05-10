class PetrolStationsController < ApplicationController
  before_action :set_petrol_station, only: %i[ show edit update destroy ]

  def index
    @petrol_stations = PetrolStation.all
  end

  def show
  end

  def new
    @petrol_station = PetrolStation.new
  end

  def edit
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
