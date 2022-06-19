class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  swagger_controller :posts, 'Posts'

  swagger_api :index do
    summary 'Returns all posts'
    notes 'Notes...'
  end
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @petrol_station = PetrolStation.find(params[:petrol_station_id])
    @post_date = PostDate.find(params[:post_date_id])
    @post = @post_date.posts.new
    @post.petrol_station_id = @petrol_station.id
  end

  def edit
  end

  def create
    @petrol_station = PetrolStation.find(params[:petrol_station_id])
    @post_date = PostDate.find(params[:post_date_id])
    @post = @post_date.posts.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@petrol_station, @post_date], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_date_params)
        format.html { redirect_to [@petrol_station, @post_date], notice: 'post_date was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_date }
      else
        format.html { render :edit }
        format.json { render json: @post_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @petrol_station = PetrolStation.find(params[:petrol_station_id])
      @post_date = PostDate.find(params[:post_date_id])
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id, :post_date_id)
    end
end
