class GamePlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform
  has_many :reviews

  validates :average_score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :review_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
