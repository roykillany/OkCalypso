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
    # @match = Match.new(match_params)
    #
    # if @match.save!
    #   render json: ""
    # else
    #   render json: @match.errors.full_messages
    # end
    match_ids = []

    current_user_answers = current_user.user_answers
    User.all.each do |user|
      next if user.id == current_user.id
      current_user.user_answers.each do |ans|
        if user.user_answers.pluck(:answer_id).include?(ans.id)
          match_ids.push(user.id)
        end
      end
    end

    match_ids.each do |id|
      print id
      # next if (Match.find_by({ matcher_id: current_user.id, matchee_id: id }) && Match.find_by({ matcher_id: id, matchee_id: current_user.id }))
      match = Match.new( { matcher_id: current_user.id, matchee_id: id })
      match.save!
      match = Match.new( { matcher_id: id, matchee_id: current_user.id })
      match.save!
    end

    render json: {}

  end

  def match_params
    params.require(:match).permit(:matchee_id, :matcher_id)
  end
end
