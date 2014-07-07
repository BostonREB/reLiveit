class UsersController < ApplicationController

  def show
    @recent_recordings = current_user.recordings.recent
    @user_shows = current_user.shows.by_date
    @user_location_shows = get_shows_by_location
    @followed_artists = get_followed_artists
  end

  def edit

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

  def get_followed_artists
    followed_acts = []
    acts = FollowingArtistRelationships.all
    acts.each do |act|
      followed_acts << act.followed_artist_id(&:name)
    end
    followed_acts
  end
end
