class FavoritesListsController < ApplicationController
  before_action :logged_in_user

  def index
    @fav_items = FavoritesList.all.includes(:user)
    render json: { @fav_items }, status: :ok
  end

  def create
    @fav_item = FavoritesList.new(item_params)
    if @fav_item.save!
      render json: { @item }, status: :added_favorite
    else
      head :no_content
    end
  end

  def destroy
    @fav_item = FavoritesList.find_by(user_id: @user.id, params[:item_id])
    @fav_item.destroy
    head :no_content
  end

  private

  def favorites_list_params
    params.require(:favorites_list).permit(:user_id, :item_id, :user_item)
  end

  def logged_in_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
