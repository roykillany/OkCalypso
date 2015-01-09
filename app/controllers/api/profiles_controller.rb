class Api::ProfilesController < ApplicationController
  before_action :ensure_logged_in

  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    @profile = Profile.find_by_user_id(params[:id])
    render json: @profile
  end

  def update
    @profile = Profile.find_by_user_id(params[:id])
    if @profile.update(profile_params)
      render json: @profile
    else
      flash.now[:errors] = @profile.errors.full_messages
    end
  end

  def profile_params
    params.require(:profile).permit(:user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason)
  end
end
