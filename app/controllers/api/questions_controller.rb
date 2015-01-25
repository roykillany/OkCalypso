class Api::QuestionsController < ApplicationController
  def index
    @questions = Question.all.select{ |q| !current_user.user_answers.pluck(:question_id).include?(q.id) }
  end

  def show
  end
end
