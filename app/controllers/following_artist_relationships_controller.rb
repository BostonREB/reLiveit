class FollowingArtistRelationshipsController < ApplicationController

    def create
    followed_artist = Artist.find(params[:id])
    current_user.follow(followed_artist)
    redirect_to artist_path
  end

  def destroy
    followed_artist = Artist.find(params[:id])
    current_user.unfollow(followed_artist)
    redirect_to artist_path
  end

end
