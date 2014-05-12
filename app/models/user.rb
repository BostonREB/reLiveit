class User < ActiveRecord::Base
  include Clearance::User

  has_many :followed_artist_relationships,
    foreign_key: :follower_id,
    class_name: 'FollowingArtistRelationships'

  has_many :followed_artists,
    through: :followed_artist_relationships

  # validates_format_of :zip, with: %r{\d{5}(-\d{4})?}, message: "should be in the form 12345 or 12345-1234"

  def follow(artist)
    followed_artists << artist
  end

  def unfollow(artist)
    followed_artists.destroy(artist)
  end

  def following?(artist)
    followed_artist_ids.include? artist.id
  end

  def map_location
    latlong = Geocoder.coordinates(zip)
    location = "geo:#{latlong[0]},#{latlong[1]}"
  end

  def find_all_user_shows
    user_shows = []
    followed_artists.each do |artist|
      artist.shows.each do |show|
        user_shows << show
      end
    end
    sorted_user_shows = user_shows.sort_by{ |show| show['date'] }
  end
end
