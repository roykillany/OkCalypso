class Api::PreferencesController < ApplicationController

  def show
    @preference = Preference.find(params[:id])
    render json: @preference
  end

end
