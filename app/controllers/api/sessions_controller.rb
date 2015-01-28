class Api::SessionsController < ApplicationController
  wrap_parameters false

  def show
    if current_user
      render :show
    else
      render json: {}
    end
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      head :unprocessable_entity
    else
      log_in(user)
      render :show
    end
  end

  def destroy
    log_out
    render json: {}
  end

  def omniauth
    user = User.find_or_create_by_auth_hash(auth_hash)
    log_in(user)
    redirect_to root_url
  end

  def update
    p params
    current_user.update(params)
    render json: {}
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
