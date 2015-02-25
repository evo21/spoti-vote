class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :artist
      t.string :track_name
      t.string :album
      t.string :spotify_id
      t.string :artwork
      t.boolean :is_explicit
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
