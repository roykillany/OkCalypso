class Api::MatchesController < ApplicationController
  def show
  end

  def create
  end

  def match_params
    params.require(:match).permit(:matchee_id)
  end
end
