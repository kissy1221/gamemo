class AddDefaultValue < ActiveRecord::Migration[8.0]
  def change
    Review.where(likes_count: nil).update_all(likes_count: 0)
    change_column_null :reviews, :likes_count, false
    change_column_null :game_platforms, :review_count, false

    change_column_default :reviews, :likes_count, from: nil, to: 0
    change_column_default :game_platforms, :review_count, from: nil, to: 0
  end
end
