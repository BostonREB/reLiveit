class Show < ActiveRecord::Base
  belongs_to :artist

  def self.by_date
    order("date DESC")
  end
end
