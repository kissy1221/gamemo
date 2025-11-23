class AddCoverImageUrlToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :cover_image_url, :string
  end
end
