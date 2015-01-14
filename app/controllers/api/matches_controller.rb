class Api::MatchesController < ApplicationController
  def show
    @match = Match.find_by_matcher_id(params[:id])
    render json: @match || {}
  end

  def index
    @matches = Match.where({matcher_id: current_user.id})
  end

  def create
    # @match = Match.new(match_params)
    #
    # if @match.save!
    #   render json: ""
    # else
    #   render json: @match.errors.full_messages
    # end
    match_id = 0
    matched_answers = 0
    matched_questions = 0

    current_user_answers = current_user.user_answers
    User.all.each do |user|
      next if user.id == current_user.id
      print user.username
      current_user.user_answers.each do |ans|
        print user.user_answers.pluck(:answer_id)
        print ans.answer_id
        if user.user_answers.pluck(:answer_id).include?(ans.answer_id)
          print "HIT MATCH"
          match_id = user.id
          matched_questions += 1
          matched_answers += 1
        elsif user.user_answers.pluck(:question_id).include?(ans.question.id)
          matched_questions += 1
        end
      end

      print match_id
      if match_id != 0
        match_percent = (matched_answers.to_f / matched_questions.to_f * 100.0).to_i
        match = Match.create({ matcher_id: current_user.id, matchee_id: match_id, match_percent: match_percent })
        match = Match.create({ matcher_id: match_id, matchee_id: current_user.id, match_percent: match_percent })
      end

      match_id = 0
      matched_answers = 0
      matched_questions = 0
    end

    render json: {}
  end

  def match_params
    params.require(:match).permit(:matchee_id, :matcher_id)
  end
end
