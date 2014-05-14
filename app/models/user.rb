class User < ActiveRecord::Base
  include Clearance::User

  validates_format_of :zip,
    with: /\A\d{5}-\d{4}|\A\d{5}\z/,
    on: :update,
    message: "Zip Code must be in form 12345 or 12345-1234"

  has_many :followed_artist_relationships,
    foreign_key: :follower_id,
    class_name: 'FollowingArtistRelationships'

  has_many :followed_artists,
    through: :followed_artist_relationships

  has_many :shows, -> { where("date > ?", Date.today) },
    through: :followed_artists

  has_many :recordings,
    through: :followed_artists

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
