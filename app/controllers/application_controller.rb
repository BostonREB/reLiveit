class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_shows_by_location
    location = request.remote_ip
    remote = Songkickr::Remote.new TourDateRetriever::SONGKICK_API_KEY
    raw_data = remote.events(location: "ip:#{location}")
    raw_data.results
  end
end
