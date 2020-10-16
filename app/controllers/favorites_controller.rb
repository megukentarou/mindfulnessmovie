class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(movie_id: params[:movie_id])
    favorite.save
    redirect_to movies_path
  end

  def destroy
    favorite = Favorite.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    favorite.destroy
    redirect_to movies_path
  end
end
