class UsersController < ApplicationController

  def show
    @recent_recordings = current_user.recordings.recent
    @user_shows = current_user.shows.by_date
    @user_location_shows = get_shows_by_location
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(
      :gets_email
    )
  end
end
