class AddIndexIgdbId < ActiveRecord::Migration[8.0]
  def change
    change_column_null :games, :igdb_id, false
    change_column_null :platforms, :igdb_id, false
    change_column_null :genres, :igdb_id, false
    add_index :games, :igdb_id, unique: true
    add_index :platforms, :igdb_id, unique: true
    add_index :genres, :igdb_id, unique: true
  end
end
