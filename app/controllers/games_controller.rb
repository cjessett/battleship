class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def create
    game = Game.new
    session[:game] = game
    redirect_to gamepage_path
  end

  def show
    @game
  end

  def update
    if @game.shoot(params[:coordinates])
      redirect_to game_path
    end
  end

  private

  def set_game
    @game = session[:game]
  end
end
