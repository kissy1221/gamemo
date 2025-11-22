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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
