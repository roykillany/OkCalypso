class Api::MatchesController < ApplicationController
  def show
    @match = Match.find_by_matcher_id(params[:id])
    render json: @match || {}
  end

  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    @match = Match.new(match_params)

    if @match.save!
      render json: ""
    else
      render json: @match.errors.full_messages
    end
  end

  def match_params
    params.require(:match).permit(:matchee_id, :matcher_id)
  end
end
