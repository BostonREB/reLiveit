class Artist < ActiveRecord::Base

  has_many :followed_artist_relationships,
    foreign_key: :followed_artist_id,
    class_name: "FollowingArtistRelationships", dependent: :destroy

  has_many :followers,
    through: :followed_artist_relationships

end
