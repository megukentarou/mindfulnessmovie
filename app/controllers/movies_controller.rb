class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @movies = Movie.all
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
    params.require(:movie).permit(:title, :url, :text, :time)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
