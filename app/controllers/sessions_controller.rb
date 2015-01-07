class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      log_in(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
