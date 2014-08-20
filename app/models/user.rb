class User < ActiveRecord::Base
  include Clearance::User
  include Artist_Following

  has_many :shows, -> { where("date > ?", Date.today) },
    through: :followed_artists

  has_many :recordings,
    through: :followed_artists

end
