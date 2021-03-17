class UsersController < ApplicationController
  def login
    @user = User.find_by(name: params[:name])
    log_in_user
    render json: @user, status: :accepted
  end

  def test
    render json: [
      user_params,
      user_params[:user],
      user_params[:name],
      params,
      params[:user],
      params[:name]
    ]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user
      render json: @user, status: :created
    else
      render json: [
        ...@user.errors.full_messages,
        user_params,
        user_params[:user],
        user_params[:name],
        params,
        params[:user],
        params[:name]
      ]
    end
  end

  def logout
    session.delete(:user_id)
    head :no_content
  end

  private

  def user_params
    params.permit(:name)
  end

  def log_in_user
    session[:user_id] = @user.id
  end
end
