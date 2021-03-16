class UsersController < ApplicationController
  def login
    @user = User.find_by(name: params[:name])
    log_in_user
    render json: { @user }, status: :logged_in
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user
      render json: { @user }, status: :new_user_logged_in
    else
      head :no_content
    end
  end

  def logout
    session.destroy
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
