class UsersController < ApplicationController

  def show
    @recent_recordings = find_recent_recordings
    @user_shows = find_all_user_shows
  end

  private

  def find_recent_recordings
    recent_recordings = []
    current_user.followed_artists.each do |artist|
      artist.recordings.each do |recording|
        if recording.upload_date.to_date > 21.days.ago
          recent_recordings << recording
        end
      end
    end
    sorted_recordings = recent_recordings.sort_by{|recording| recording['date']}.reverse
    sorted_recordings
  end

  def find_all_user_shows
    user_shows = []
    current_user.followed_artists.each do |artist|
      artist.shows.each do |show|
        user_shows << show
      end
    end
    sorted_user_shows = user_shows.sort_by{|show| show['date']}
    sorted_user_shows
  end
end
