class User < ActiveRecord::Base
  include Clearance::User

  has_many :followed_artist_relationships,
    foreign_key: :follower_id,
    class_name: 'FollowingArtistRelationships'

  has_many :followed_artists,
    through: :followed_artist_relationships

  def follow(artist)
    followed_artists << artist
  end

  def unfollow(artist)
    followed_artists.destroy(artist)
  end

  def following?(artist)
    followed_artist_ids.include? artist.id
  end
end
