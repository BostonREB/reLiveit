class HomesController < ApplicationController
  before_action :goto_user, if: :signed_in?

  def show

  end

private

def goto_user
    redirect_to user_path(current_user)
  end
end
