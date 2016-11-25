class ScoresController < ApplicationController
  # lists top scores
  def index
    @scores = Score.top
  end

  # creates a new score with the score in the session
  def create
    score = Score.new(result: session[:game].score, user_id: current_user.id)
    if score.save
      session.delete(:game)
      redirect_to scores_path
    else
      flash[:notice] = score.errors
    end
  end
end
