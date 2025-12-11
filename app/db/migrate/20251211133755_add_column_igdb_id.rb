class AddColumnIgdbId < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :igdb_id, :bigint
    add_column :platforms, :igdb_id, :bigint
    add_column :genres, :igdb_id, :bigint
  end
end
