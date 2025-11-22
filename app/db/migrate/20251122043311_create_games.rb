class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description
      t.date :release_date
      t.string :developer
      t.string :publisher
      t.string :official_site_url

      t.timestamps
    end
  end
end
