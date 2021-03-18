class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.all
    render json: @items, status: :ok
  end

  def show
    render json: @item, status: :ok
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors.full_messages, status: :not_acceptable
    end
  end

  def update
    @item.update(item_params)
    if @item.errors.full_messages.empty?
      render json: @item, status: :created
    else
      render json: @item.errors.full_messages, status: :not_acceptable
    end
  end

  def destroy
    @item.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end
