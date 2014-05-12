class HomesController < ApplicationController
  before_action :ensure_user_has_location, if: :signed_in?

  def show

  end

  private

  def ensure_user_has_location
    if current_user.city.blank?
      redirect_to edit_user_path(current_user)
    else
      redirect_to current_user
    end
  end
end
