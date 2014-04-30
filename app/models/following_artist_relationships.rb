class FollowingArtistRelationships < ActiveRecord::Base
  belongs_to :followed_artist, class_name: "Artist"
  belongs_to :follower, class_name: "User"
end
