class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    if params[:time]
      @movies = Movie.where('time LIKE ?', "%#{params[:time]}%").order("created_at DESC").page(params[:page]).per(8)
      flash[:notice] = "動画の絞り込みを行いました"
    else
      @movies = Movie.all.order("created_at DESC").page(params[:page]).per(8)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path, notice: "動画の新規投稿が完了しました"
    else
      flash.now[:alert] = "入力内容漏れがあります。下記を参照に修正してください。"
      render :new
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    if movie.destroy
      redirect_to root_path, notice: "動画の削除が完了しました。"
    else
      flash.now[:alert] = "動画が削除できませんでした。"
      render :movies
    end
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
