class PostDatesController < ApplicationController
  before_action :set_post_date, only: %i[show edit update destroy ]

  swagger_controller :post_dates, 'Post Dates'

  swagger_api :index do
    summary 'Returns all post dates'
    notes 'Notes...'
  end
  def index
    @post_dates = PostDate.all
  end

  swagger_api :show do
    summary 'Returns one post date'
    param :path, :petrol_station_id, :integer, :required, "Petrol Station id"
    param :path, :id, :integer, :required, "Post date id"
    notes 'Notes...'
  end
  def show
  end

  def new
    @petrol_station = PetrolStation.find(params[:petrol_station_id])
    # tutaj występuje bład, gdy dam post_dates ! - podczas "Dodaj datę"
    @post_date = @petrol_station.post_date.new
  end

  def edit
  end

  swagger_api :create do
    summary "Create new post date"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :petrol_station_id, :integer, :required, "Petrol Station id"
    param :form, "post_date[title]", :string, :required, "Title of a post date"
  end
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

  swagger_api :update do
    summary "Update a post date"
    param :path, :id, :integer, :required, "Post date id"
    param :path, :petrol_station_id, :integer, :required, "Petrol Station id"
    param :form, "post_date[title]", :string, :required, "Post date title"
  end
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


  swagger_api :destroy do
    summary 'Destroys a post date'
    param :path, :id, :integer, :required, "Post date id"
    param :path, :petrol_station_id, :integer, :required, "Petrol Station id"
    notes 'Notes...'
  end
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

    def post_date_params
      params.require(:post_date).permit(:title, :user_id, :petrol_station_id)
    end
end
