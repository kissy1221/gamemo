class HomeController < ApplicationController
  def index
    @new_games = Game.order(release_date: :desc).limit(20)
  end
end
