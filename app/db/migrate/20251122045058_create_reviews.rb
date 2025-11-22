class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_platform, null: false, foreign_key: true
      t.integer :score
      t.string :title
      t.text :body
      t.boolean :is_public
      t.integer :likes_count

      t.timestamps
    end
  end
end
