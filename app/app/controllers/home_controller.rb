class HomeController < ApplicationController
  def index
    @new_games = Game.new_games
    @best_games = Game.best_games
    @recently_reviewed_games = Game.recently_reviewed_games
  end
end
