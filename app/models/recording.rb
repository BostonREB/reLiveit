class Recording < ActiveRecord::Base
  belongs_to :artist

  def self.by_date
    order("upload_date DESC")
  end

  def self.recent
    where("upload_date > ?", 21.days.ago).by_date
  end
end
