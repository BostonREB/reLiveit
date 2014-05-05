class ArtistsController < ApplicationController

  def index
    @artists = Artist.alphabetical
  end

  def show
    @artist = Artist.find(params[:id])
    tour_dates = TourDateRetriever.new(@artist)
    @events = tour_dates.get_tour_api_data
    retrieve_recordings = RecordingRetriever.new(@artist)
    retrieve_recordings.get_api_data
    @recordings = @artist.recordings.by_date
  end
end
