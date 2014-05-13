class HomesController < ApplicationController
  before_action :ensure_user_has_location, if: :signed_in?

  def show
    @user_location_shows = get_shows_by_location
  end

  private

  def ensure_user_has_location
    if current_user.city.blank?
      redirect_to edit_user_path(current_user)
    else
      redirect_to current_user
    end
  end

  def get_shows_by_location
    location = request.remote_ip
    remote = Songkickr::Remote.new TourDateRetriever::SONGKICK_API_KEY
    raw_data = remote.events(location: "ip:#{location}")
    raw_data.results
  end
end
