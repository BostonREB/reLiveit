class HomesController < ApplicationController
  before_action :goto_user, if: :signed_in?

  def show

  end

private

  def goto_user
    if current_user.city == ""
      redirect_to edit_user_path(current_user)
    else
      redirect_to current_user
    end
  end
end
