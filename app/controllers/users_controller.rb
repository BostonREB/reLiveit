class UsersController < ApplicationController

  def show
    @followed_artists = current_user.followed_artists
    @recent_recordings = find_recent_recordings
  end

  private

  def find_recent_recordings
    @recent_recordings = []
    current_user.followed_artists.each do |artist|
      artist.recordings.each do |recording|
        if recording.upload_date.to_date > 21.days.ago
          @recent_recordings << recording
        end
      end
    end
    @recent_recordings
  end
end
