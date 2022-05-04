class PetrolStationsController < ApplicationController
  before_action :set_petrol_station, only: %i[ show edit update destroy ]

  # GET /petrol_stations or /petrol_stations.json
  def index
    @petrol_stations = PetrolStation.all
  end

  # GET /petrol_stations/1 or /petrol_stations/1.json
  def show
  end

  # GET /petrol_stations/new
  def new
    @petrol_station = PetrolStation.new
  end

  # GET /petrol_stations/1/edit
  def edit
  end

  # POST /petrol_stations or /petrol_stations.json
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

  # PATCH/PUT /petrol_stations/1 or /petrol_stations/1.json
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

  # DELETE /petrol_stations/1 or /petrol_stations/1.json
  def destroy
    @petrol_station.destroy

    respond_to do |format|
      format.html { redirect_to petrol_stations_url, notice: "Petrol station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petrol_station
      @petrol_station = PetrolStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def petrol_station_params
      params.require(:petrol_station).permit(:name, :address)
    end
end
