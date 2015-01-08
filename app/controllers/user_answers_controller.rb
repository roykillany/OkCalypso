class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new(user_answer_params)
    if @user_answer.save
    else
      flash.now[:errors] = @user_answer.errors.full_messages
    end
  end

  def user_answer_params
    params.require(:user_answers).permit(:user_id, :answer_id, :question_id)
  end
end
