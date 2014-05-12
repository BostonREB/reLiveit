class Show < ActiveRecord::Base
  belongs_to :artist

  def self.by_date
    order("date ASC")
  end
end
