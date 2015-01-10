class Api::MatchesController < ApplicationController
  def show
    @match = Match.find_by_matcher_id(params[:id])
    render json: @match || {}
  end

  def create
  end

  def match_params
    params.require(:match).permit(:matchee_id)
  end
end
