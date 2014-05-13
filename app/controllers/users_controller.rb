class UsersController < ApplicationController

  def show
    @recent_recordings = current_user.recordings.recent
    @user_shows = current_user.shows.by_date
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

  def get_shows_by_location
    location = request.remote_ip
    remote = Songkickr::Remote.new TourDateRetriever::SONGKICK_API_KEY
    raw_data = remote.events(location: "ip:#{location}")
    raw_data.results
  end
end
