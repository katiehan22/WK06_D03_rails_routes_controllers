class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, index: true
      t.string :image_url, null: false, unique: true
      t.bigint :artist_id, null:false
      t.timestamps
    end
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
