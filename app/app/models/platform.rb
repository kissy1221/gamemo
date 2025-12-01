class Platform < ApplicationRecord
  has_many :game_platforms

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :slug, length: { maximum: 15 }
end
