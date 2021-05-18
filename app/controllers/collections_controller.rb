class CollectionsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @collection = Collection.find(params[:id])
  end
  
  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(post_params)
    @collection.user_id = current_user.id
    
    if @collection.save
      flash[:success] = 'collectionを作成しました。'
      redirect_to users_url
    else
      flash.now[:danger] = 'collection作成に失敗しました。'
      render :new
    end
  end
  
  def edit
    @collection = Collection.find(params[:id])
  end
  
  def update
    @collection = Collection.find(params[:id])
    
    if @collection.update(post_params)
      flash[:success] = '会員情報は正常に更新されました'
      redirect_to @collection
    else
      flash.now[:danger] = '会員情報は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @collection.destroy
    flash[:success] = 'collectionを削除しました'
    redirect_to root_url
  end
  
  private
  
  def post_params
    params.require(:collection).permit(:title, :content, :image)
  end
  
  def correct_user
    @collection = current_user.collections.find_by(id: params[:id])
    unless @collection
      redirect_to root_url
    end
  end
    
end
