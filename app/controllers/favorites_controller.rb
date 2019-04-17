class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    redirect_to(fallback_location: root_path)
  end

  def destroy
    micropost = Favorite.find(params[:id]).micropost
    current_user.unlike(micropost)
    redirect_to(fallback_location: root_path)
  end
end
