class FollowingArtistRelationshipsController < ApplicationController

  def create
    @followed_artist = Artist.find(params[:id])
    current_user.follow(@followed_artist)
    render :change
  end

  def destroy
    @followed_artist = Artist.find(params[:id])
    current_user.unfollow(@followed_artist)
    render :change
  end
end
