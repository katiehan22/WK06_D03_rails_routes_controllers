# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: { scope: :title }, presence: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :artwork

    has_many :shared_viewers,
        through: :shares,
        source: :viewer 

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork

    def self.artworks_for_user_id(user_id)
        Artwork
        .left_outer_joins(:shared_viewers)
        .where("artwork_shares.viewer_id = (?) OR artworks.artist_id = (?)", user_id, user_id)
    end
end
