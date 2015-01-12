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
    @matches = []
    matches_ids = []

    current_user_answers = UserAnswer.all.where(user_id: current_user.id)

    User.all.each do |user|
      next if user.id == current_user.id

      this_user_answers = UserAnswer.all.where(user_id: user.id)
      current_user_answers.each do |ans|
        if this_user_answers.find_by_answer_id(ans.answer_id)
          matches_ids.push(user.id)
        end
      end
    end

    matches_ids.each do |id|
      @matches.push(Match.create!({ matcher_id: current_user.id, matchee_id: id }))
    end

    render json: @matches
  end

  def match_params
    params.require(:match).permit(:matchee_id)
  end
end
