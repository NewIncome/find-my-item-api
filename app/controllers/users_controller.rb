class UsersController < ApplicationController
  def login
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      render json: @user, status: :accepted
    else
      render json: 'User not found', status: :not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :not_acceptable
    end
  end

  def logout
    session.delete(:user_id)
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def log_in_user
    session[:user_id] = @user.id
  end
end
