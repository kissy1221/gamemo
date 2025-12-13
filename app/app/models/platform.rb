class Platform < ApplicationRecord
  has_many :game_platforms

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :slug, length: { maximum: 100 }
  validates :igdb_id, presence: true, uniqueness: true
end
