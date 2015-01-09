class UserAnswersController < ApplicationController
  before_action :ensure_logged_in

  def create
    @user_answer = current_user.user_answers.new(user_answer_params)
    if @user_answer.save
      redirect_to user_questions_url(user_answer_params[:user_id])
    else
      flash.now[:errors] = @user_answer.errors.full_messages
    end
  end

  def user_answer_params
    params.require(:user_answers).permit(:answer_id, :question_id)
  end
end
