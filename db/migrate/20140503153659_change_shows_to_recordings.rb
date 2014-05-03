class ChangeShowsToRecordings < ActiveRecord::Migration
  def change
    rename_table :shows, :recordings
  end
end
