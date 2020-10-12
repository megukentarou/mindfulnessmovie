class UsersController < ApplicationController

  def imdex

  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    # @movies = user.movies.page(params[:page]).per(5).order("created_at DESC")
    @favorite_movies = @user.favorite_movie
  end
end
