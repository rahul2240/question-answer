class PlaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @question = Question.find(current_user.question_number)
  end

  def answer
    @question = Question.find(current_user.question_number)
    @answer = params["answer"]
    if @answer == @question.answer && current_user.question_number.to_i == @question.id.to_i
      current_user.score =  current_user.score.to_i  + 10
      current_user.question_number =  current_user.question_number.to_i + 1
      current_user.save
    end
    redirect_to '/plays/index'
  end

  def leaderboard
    @users = User.order("score DESC").all

  end

end
