class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = 
      if current_user == @user
        @user.reviews
      else
        @user.reviews.where(is_public: true)
      end
    @total_likes_count = @reviews.sum(:likes_count) || 0
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def user_params
  end

  def game_params
  end
end
