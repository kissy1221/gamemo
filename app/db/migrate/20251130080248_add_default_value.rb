class AddDefaultValue < ActiveRecord::Migration[8.0]
  def change
    change_column_default :reviews, :likes_count, from: nil, to: 0
    change_column_default :game_platforms, :review_count, from: nil, to: 0
  end
end
