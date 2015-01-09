class Api::MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    if @match
      render json: @match
    else
      render json: @match.errors.full_messages
    end
  end

  def create
  end

  def match_params
    params.require(:match).permit(:matchee_id)
  end
end
