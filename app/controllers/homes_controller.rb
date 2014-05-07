class HomesController < ApplicationController
  before_action :goto_user, if: :signed_in?

  def show

  end

private

  def goto_user
    if current_user.id == 1
      get_recordings_from_live_music_archive
      get_tour_dates_from_songkick
    end
    redirect_to current_user
  end
end
