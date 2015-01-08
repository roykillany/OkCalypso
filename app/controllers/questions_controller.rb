class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @user = User.find_by_id(params[:user_id])
    render :index
  end
end
