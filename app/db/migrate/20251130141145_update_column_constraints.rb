class UpdateColumnConstraints < ActiveRecord::Migration[8.0]
  def change
    change_column_null :genres, :name, false
    change_column_null :platforms, :name, false

    change_column_default :game_platforms, :average_score, from: nil, to: 0.0
    change_column_null :game_platforms, :average_score, false

    change_column_default :reviews, :score, from: nil, to: 0
    change_column_null :reviews, :score, false
    
    change_column_default :reviews, :is_public, from: nil, to: false
    change_column_null :reviews, :is_public, false
    
    change_column_null :users, :password_digest, false
  end
end
