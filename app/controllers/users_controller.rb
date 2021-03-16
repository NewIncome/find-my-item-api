class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
