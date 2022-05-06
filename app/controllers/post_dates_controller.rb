class PostDatesController < ApplicationController
  before_action :set_post_date, only: [:show, :edit, :update, :destroy ]

  # GET /post_dates or /post_dates.json
  def index
    @post_dates = PostDate.all
  end

  # GET /post_dates/1 or /post_dates/1.json
  def show
  end

  # GET /post_dates/new
  def new
    @petrol_station = PetrolStation.find(params[:petrol_station_id])
    # tutaj występuje bład, gdy dam post_dates ! - podczas "Dodaj datę"
    @post_date = @petrol_station.post_date.new
  end

  # GET /post_dates/1/edit
  def edit
  end

  # POST /post_dates or /post_dates.json
  def create
    @petrol_station = PetrolStation.find(params[:petrol_station_id])
    # tutaj występuje błąd, gdy ustawie @petrol_station.post_dates.new - po zakończeniu tworzenia "PostDate", czyt. uzupełnisz dane i klikasz "Create Post date"
    # błąd: undefined method `post_dates' for #<PetrolStation id: 1, name: "Orlen (Szybowcowa)", address: "ul. Szybowcowa 27, Wrocław", created_at: "2022-05-04 19:37:53.821037000 +0000", updated_at: "2022-05-04 19:37:53.821037000 +0000">
    @post_date = @petrol_station.post_date.new(post_date_params)
    @post_date.user = current_user
  
    respond_to do |format|
      if @post_date.save
        format.html { redirect_to [@petrol_station, @post_date], notice: 'post_date was successfully created.' }
        format.json { render :show, status: :created, location: @post_date }
      else
        format.html { render :new }
        format.json { render json: @post_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_dates/1 or /post_dates/1.json
  def update
    respond_to do |format|
      if @post_date.update(post_date_params)
        format.html { redirect_to [@petrol_station, @post_date], notice: 'post_date was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_date }
      else
        format.html { render :edit }
        format.json { render json: @post_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_dates/1 or /post_dates/1.json
  def destroy
    @post_date.destroy

    respond_to do |format|
      format.html { redirect_to post_dates_url, notice: "Post date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post_date
      @petrol_station = PetrolStation.find(params[:petrol_station_id])
      @post_date = PostDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_date_params
      params.require(:post_date).permit(:title, :user_id, :petrol_station_id)
    end
end
