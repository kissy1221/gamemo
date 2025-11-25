class RemoveNotNullFromReviewsUser < ActiveRecord::Migration[8.0]
  def up
    change_column_null :reviews, :user_id, true
  end
  def down
    change_column_null :reviews, :user_id, false
  end
end
