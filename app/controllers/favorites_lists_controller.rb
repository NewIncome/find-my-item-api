class FavoritesListsController < ApplicationController
  # before_action :logged_in_user

  def index
    @fav_items = FavoritesList.all.includes(:user).where(user_id: params[:user_id])
    render json: @fav_items, status: :ok
  end

  def create
    @fav_item = FavoritesList.new(
      user_id: params[:user_id],
      item_id: favorites_list_params[:item_id]
    )
    if @fav_item.save
      render json: @fav_item, status: :created
    else
      render json: @fav_item.errors.full_messages, status: :not_acceptable
    end
  end

  def destroy
    @fav_item = FavoritesList.find_by(
      user_id: params[:user_id],
      item_id: favorites_list_params[:item_id]
    )
    @fav_item.destroy
    head :no_content
  end

  def test
    render json: [
      session,
      params
    ]
  end

  private

  def favorites_list_params
    params.require(:favorites_list).permit(:user_id, :item_id)
  end

  def logged_in_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    @user || render(json: ['User not signed in', session[:user_id], @user], status: :unauthorized)
  end
end
