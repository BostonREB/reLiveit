class ArtistsController < ApplicationController

  def index
    @artists = Artist.alphabetical
  end

  def show
    @artist = Artist.find(params[:id])
    @events = @artist.shows.by_date
    @recordings = @artist.recordings.by_date
  end
end
