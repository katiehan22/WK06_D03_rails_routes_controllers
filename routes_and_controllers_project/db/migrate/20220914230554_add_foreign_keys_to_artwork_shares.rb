class AddForeignKeysToArtworkShares < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id, primary_key: :id
    add_foreign_key :artwork_shares, :users, column: :viewer_id, primary_key: :id 
  end
end
