class PreferencesController < ApplicationController
  before_action :ensure_logged_in

  def update
    @preference = Preference.find_by_user_id(params[:user_id])
    if @preference.update(preference_params)
      redirect_to user_url(@preference.user_id)
    else
      flash.now[:errors] = @preference.errors.full_messages
    end
  end

  def preference_params
    params.require(:preference).permit(:target_people, :target_age_range, :target_location, :target_purpose, :user_id)
  end
end
