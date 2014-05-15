class Artist < ActiveRecord::Base

  has_many :followed_artist_relationships,
    foreign_key: :followed_artist_id,
    class_name: "FollowingArtistRelationships", dependent: :destroy

  has_many :followers,
    through: :followed_artist_relationships

  has_many :recordings, dependent: :destroy
  has_many :shows, -> { where("date > ?", Date.today) }, dependent: :destroy

  def self.alphabetical
    order("lower(name) ASC")
  end
end
