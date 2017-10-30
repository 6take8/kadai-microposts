class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  # ログインユーザがあるmicropostをお気に入りにする
  def create
    micropost = Micropost.find(params[:favorite_microposts_id])
    # TODO: ログインユーザのお気に入り
    current_user.favorite(micropost)
    flash[:success] = 'ポストをお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  # ログインユーザがお気に入り済のmicropostを解除する
  def destroy
    micropost = Micropost.find(params[:favorite_microposts_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'ポストのお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
