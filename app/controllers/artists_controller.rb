class ArtistsController < ApplicationController

  def index
    @artists = Artist.alphabetical
  end

  def show
    @artist = Artist.find(params[:id])
    tour_dates = RetrieveTourDate.new(@artist)
    @events = tour_dates.get_tour_api_data
    retieve_recordings = RetrieveRecording.new(@artist)
    retieve_recordings.get_api_data
    @recordings = @artist.recordings.by_date
  end
end
