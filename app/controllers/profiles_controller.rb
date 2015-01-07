class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:user_id])
    if @profile.update(profile_params)
      # redirect_to user_url(@profile.user_id)
    else
      flash.now[:errors] = @profile.errors.full_messages
    end
  end

  def profile_params
    params.require(:profile).permit(:user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason)
  end
end
