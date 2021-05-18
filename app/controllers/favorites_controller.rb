class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    collection = Collection.find(params[:collection_id])
    current_user.favorite(collection)
    flash[:success] = "お気に入りに登録しました"
    redirect_to collection
  end

  def destroy
    collection = Collection.find(params[:collection_id])
    current_user.unfavorite(collection)
    flash[:success] = "お気に入りを解除しました"
    redirect_to collection
  end
end
