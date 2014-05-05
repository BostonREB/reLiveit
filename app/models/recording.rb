class Recording < ActiveRecord::Base
  belongs_to :artist, dependent: :destroy

  def self.by_date
    order("upload_date DESC")
  end
end
