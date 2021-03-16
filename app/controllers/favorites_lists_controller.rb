class FavoritesListsController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def favorites_list_params
    params.require(:favorites_list).permit(:user_id, :item_id, :user_item)
  end
end
