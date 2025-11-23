class Game < ApplicationRecord
  has_many :game_genres
  has_many :game_platforms
  has_many :reviews, through: :game_platforms
  has_many :genres, through: :game_genres
  has_many :platforms, through: :game_platforms

  scope :new_games, -> {where.not(release_date: nil).order(release_date: :desc).limit(20)}
  scope :best_games, -> {
    left_joins(game_platforms: :reviews)
      .where.not(reviews: { score: nil })
      .group('games.id')
      .select('games.*, AVG(reviews.score) as avg_score')
      .order('avg_score DESC')
      .limit(20)
    }
  scope :recently_reviewed_games, -> {
    joins(game_platforms: :reviews)
      .select('games.*, MAX(reviews.created_at) as latest_review_at')
      .group('games.id')
      .order('latest_review_at DESC')
      .limit(20)
  }

  # 検索可能なカラム
  def self.ransackable_attributes(auth_object = nil)
    %w[
      name
    ]
  end

  def average_score
    reviews.where.not(score: nil).average(:score)
  end
end
