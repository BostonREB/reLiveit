class UsersController < ApplicationController

  def show
    @recent_recordings = find_recent_recordings
    @user_shows = current_user.find_all_user_shows
    @user_location_shows = get_shows_by_location
  end

  def edit

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(
      :city,
      :zip
    )
  end

  def find_recent_recordings
    recent_recordings = []
    current_user.followed_artists.each do |artist|
      artist.recordings.each do |recording|
        if recording.upload_date.to_date > 21.days.ago
          recent_recordings << recording
        end
      end
    end
    recent_recordings.sort_by{ |recording| recording['upload_date'] }.reverse
  end

  def get_shows_by_location
    location = current_user.map_location
    remote = Songkickr::Remote.new TourDateRetriever::SONGKICK_API_KEY
    raw_data = remote.events(location: location)
    events = raw_data.results
  end
end
