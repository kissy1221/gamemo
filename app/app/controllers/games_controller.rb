class GamesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.where(is_public: true)
    @average_score = @reviews.where.not(score: nil).average(:score)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
