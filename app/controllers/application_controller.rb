class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_recordings_from_live_music_archive
    artists = Artist.all
    artists.each do |artist|
      lma_recordings = RecordingRetriever.new(artist)
      lma_recordings.get_api_data
    end
  end

  def get_tour_dates_from_songkick
    artists = Artist.all
    artists.each do |artist|
      artist_tour_dates = TourDateRetriever.new(artist)
      artist_tour_dates.get_tour_api_data
    end
  end
end
