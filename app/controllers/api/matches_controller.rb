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
    if current_user.user_answers.count < 10
      render json: { resp: "Answer more questions BEEPBOOP LUKE I AM YOUR FATHER" }
    else
      current_user_answers = current_user.user_answers

      User.all.each do |user|
        next if user.id == current_user.id

        match_stats = find_match_stats(user)
        next if match_stats.nil?

        match_id = match_stats[0]
        matched_answers = match_stats[1]
        matched_questions = match_stats[2]
        match_percent = match_stats[3]
        p match_percent

        match = Match.find_by({ matcher_id: current_user.id, matchee_id: match_id})
        if match
          match.update({ match_percent: match_percent })
          p "HIT THE FUCKING UPDATE BITCHES"
        else
          Match.create({ matcher_id: current_user.id, matchee_id: match_id, match_percent: match_percent })
        end
      end

      render json: {}
    end
  end

  def match_params
    params.require(:match).permit(:matchee_id, :matcher_id, :match_percent)
  end

  private
  def find_match_stats(user)
    match_id = 0
    matched_answers = 0
    matched_questions = 0

    current_user.user_answers.each do |ans|
      if user.user_answers.pluck(:answer_id).include?(ans.answer_id)
        match_id = user.id
        matched_questions += 1
        matched_answers += 1
      elsif user.user_answers.pluck(:question_id).include?(ans.question.id)
        matched_questions += 1
      end
    end

    if match_id != 0
      match_percent = (matched_answers.to_f / matched_questions.to_f * 100.0).to_i
      return [match_id, matched_answers, matched_questions, match_percent]
    else
      return nil
    end
  end
end
