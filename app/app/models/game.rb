class Game < ApplicationRecord
  has_many :game_genres
  has_many :game_platforms
  has_many :reviews, through: :game_platforms
  has_many :genres, through: :game_genres
  has_many :platforms, through: :game_platforms

  # 検索可能なカラム
  def self.ransackable_attributes(auth_object = nil)
    %w[
      name
    ]
  end
end
