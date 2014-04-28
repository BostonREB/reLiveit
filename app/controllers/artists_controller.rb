class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.artists.find_or_create_by(artist_params)
    redirect_to user_path(current_user)
  end

private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
