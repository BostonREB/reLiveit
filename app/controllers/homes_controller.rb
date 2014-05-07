class HomesController < ApplicationController
  before_action :get_api_data, if: :signed_in?
  before_action :goto_user, if: :signed_in?

  def show

  end

private

  def get_api_data
    if current_user.id == 1
      get_recordings_from_live_music_archive
      get_tour_dates_from_songkick
    end
  end

  def goto_user
    redirect_to current_user
  end
end
