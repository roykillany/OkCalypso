class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:user_id])
    @profile.update!
  end

  def profile_params
    params.require(:profile).permit(:user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason)
  end
end
