class HomesController < ApplicationController
  before_action :goto_user, if: :signed_in?

  def show

  end

private

  def goto_user
    get_recordings_from_lma
    get_tour_dates_from_songkick
    redirect_to current_user
  end

  def get_recordings_from_lma
    current_user.followed_artists.each do |artist|
      lma_recordings = RecordingRetriever.new(artist)
      lma_recordings.get_api_data
    end
  end

  def get_tour_dates_from_songkick
    current_user.followed_artists.each do |artist|
      artist_tour_dates = TourDateRetriever.new(artist)
      artist_tour_dates.get_tour_api_data
    end
  end
end
