class GamesController < ApplicationController
  def new
    @game = Game.new
    session[:game] = @game
  end

  def update
    @game = session[:game]
    @game.shoot(params[:coordinates])
  end
end
