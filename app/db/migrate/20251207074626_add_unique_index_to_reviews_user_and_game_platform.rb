class AddUniqueIndexToReviewsUserAndGamePlatform < ActiveRecord::Migration[8.0]
  def up
    # 重複解消
    duplicates = Review.group(:user_id, :game_platform_id)
                        .having('COUNT(*) > 1')
                        .pluck(:user_id, :game_platform_id)

    duplicates.each do |user_id, game_platform_id|
      reviews = Review.where(user_id: user_id, game_platform_id: game_platform_id)
                      .order(created_at: :desc)  # 新しい順に並べる
      reviews.offset(1).delete_all               # 1件残して残り削除
    end

    add_index :reviews, [:user_id, :game_platform_id], unique: true, name: 'index_reviews_on_user_id_and_game_platform_id'
  end

  def down
    remove_index :reviews, name: 'index_reviews_on_user_id_and_game_platform_id'
  end
end
