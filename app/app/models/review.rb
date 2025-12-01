class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game_platform

  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :title, length: { maximum: 100 }
  validates :is_public, inclusion: { in: [true, false] }
  validates :likes_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
