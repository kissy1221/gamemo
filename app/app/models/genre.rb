class Genre < ApplicationRecord
  has_many :game_genres

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :slug, length: { maximum: 15 }
  validates :igdb_id, presence: true, uniqueness: true
end
