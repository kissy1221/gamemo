class GamesController < ApplicationController
  def index
    @games = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.where(is_public: true).page(params[:page]).per(21)
    @average_score = @reviews.where.not(score: nil).average(:score)
  end

end
