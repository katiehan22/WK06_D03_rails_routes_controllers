# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

%w(users artworks artwork_shares comments).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end

#users
user1 = User.create!(username: "kt")
user2 = User.create!(username: "connor")
user3 = User.create!(username: "mike")
user4 = User.create!(username: "abby")
user5 = User.create!(username: "chris")

#artworks
artwork1 = Artwork.create!(title: "node to joy", image_url: "url1.com", artist_id: user1.id)
artwork2 = Artwork.create!(title: "late", image_url: "url2.com", artist_id: user1.id)
artwork3 = Artwork.create!(title: "early", image_url: "url3.com", artist_id: user2.id)
artwork4 = Artwork.create!(title: "egg", image_url: "url4.com", artist_id: user2.id)
artwork5 = Artwork.create!(title: "fart", image_url: "url5.com", artist_id: user3.id)
artwork6 = Artwork.create!(title: "bart", image_url: "url6.com", artist_id: user3.id)
artwork7 = Artwork.create!(title: "fruit bowl", image_url: "url7.com", artist_id: user4.id)
artwork8 = Artwork.create!(title: "starry night", image_url: "url8.com", artist_id: user4.id)
artwork9 = Artwork.create!(title: "attendance time", image_url: "url9.com", artist_id: user5.id)
artwork10 = Artwork.create!(title: "hand gestures", image_url: "url10.com", artist_id: user5.id)

#artwork_shares
artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user1.id)
artwork_share3 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user3.id)
artwork_share4 = ArtworkShare.create!(artwork_id: artwork10.id, viewer_id: user4.id)
artwork_share5 = ArtworkShare.create!(artwork_id: artwork7.id, viewer_id: user5.id)
artwork_share6 = ArtworkShare.create!(artwork_id: artwork10.id, viewer_id: user2.id)
artwork_share7 = ArtworkShare.create!(artwork_id: artwork7.id, viewer_id: user1.id)

#comments
comment1 = Comment.create!(author_id: user1.id, artwork_id: artwork3.id, body: "Gorgis")
comment2 = Comment.create!(author_id: user1.id, artwork_id: artwork7.id, body: "I loveeeee bananas")
comment3 = Comment.create!(author_id: user2.id, artwork_id: artwork1.id, body: "So creative!!")
comment4 = Comment.create!(author_id: user2.id, artwork_id: artwork9.id, body: "Boooooo")
comment5 = Comment.create!(author_id: user3.id, artwork_id: artwork9.id, body: "I don't think it's that bad!!")
comment6 = Comment.create!(author_id: user4.id, artwork_id: artwork6.id, body: "Smelly")
comment7 = Comment.create!(author_id: user5.id, artwork_id: artwork5.id, body: "Second smelliest")
