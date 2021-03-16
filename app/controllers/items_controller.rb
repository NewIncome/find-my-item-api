class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: { @items }, status: :ok
  end

  def show
    @item = Item.find_by(id: params[:id])
    render json: { @item }, status: :ok
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
