class ScoresController < ApplicationController
  # lists top scores
  def index
    @scores = Score.top
  end

  # creates a new score with the score in the session
  def create
    score = Score.new(result: session[:game].score, user_id: current_user.id)
    score.save
    redirect_to scores_path
  end
end
