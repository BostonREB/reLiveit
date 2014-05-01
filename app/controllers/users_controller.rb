class UsersController < ApplicationController

  def show
    @followed_artists = current_user.followed_artists
  end
end
