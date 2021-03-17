class UsersController < ApplicationController
  def login
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      render json: [session[:user_id], @user, @user.id], status: :accepted
    else
      render json: "User not found", status: :not_found
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

  def test
    render json: [
      session,
      session[:user_id],
      session.keys,
      session.values,
      session.id,
      session.has_key?(:user_id),
      session.has_key?('user_id'),
      # session.methods,
      params
    ]
  end

  def logout
    session.delete(:user_id)
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  # def log_in_user
  #   session[:user_id] = @user.id
  # end
end
