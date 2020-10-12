class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @movies = Movie.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  def edit
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
  end

  def show
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :url, :text, :time).merge(user_id: current_user.id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
