class ReviewsController < ApplicationController
  before_action :require_login, only: [:create, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @reviews = 
      if current_user == @user
        @user.reviews
      else
        @user.reviews.where(is_public: true)
      end
    @reviews = @reviews.page(params[:page]).per(21)
    @total_likes_count = @reviews.sum(:likes_count) || 0
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to game_path(params[:game_id]), notice: 'Review was successfully created.'
    else

    end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_back fallback_location: root_path, notice: 'Review was successfully updated.'
    else
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    if @review.destroy
      redirect_back fallback_location: root_path, notice: 'Review was successfully destroyed.'
    else
    end
  end

  def check
    return render json: { review: nil }, status: :unauthorized unless logged_in?
    
    game_platform_id = params[:game_platform_id]
    return render json: { review: nil }, status: :bad_request unless game_platform_id.present?
    
    # 現在のユーザーがそのプラットフォームでレビューを投稿済みかチェック
    review = current_user.reviews.find_by(game_platform_id: game_platform_id)
    
    if review
      render json: {
        review: {
          id: review.id,
          title: review.title,
          body: review.body,
          score: review.score,
          is_public: review.is_public
        }
      }
    else
      render json: { review: nil }
    end
  end

  private
  def review_params
    params.require(:review).permit(:game_platform_id, :title, :body, :score, :is_public)
  end
end
