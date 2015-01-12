class Api::UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.save!
    render json: @user_answer
  end

  def index
    @user_answers = UserAnswer.all
    render json: @user_answers
  end

  def user_answer_params
    params.require(:user_answer).permit(:question_id, :answer_id, :user_id)
  end
end
