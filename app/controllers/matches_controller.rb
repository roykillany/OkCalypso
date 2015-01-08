class MatchesController < ApplicationController
  before_action :ensure_logged_in

  def create
    @user = User.find_by_id(params[:user_id])
    
  end

  def index
  end

  def matches_params
    params.require(:matches).permit(:matcher_id, :matchee_id)
  end
end
