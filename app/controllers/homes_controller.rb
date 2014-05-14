class HomesController < ApplicationController
  before_action :go_to_user_page, if: :signed_in?

  def show
    @user_location_shows = get_shows_by_location
  end

  private

  def go_to_user_page
    redirect_to current_user
  end
end
