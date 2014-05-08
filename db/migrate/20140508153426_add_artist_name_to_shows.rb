class AddArtistNameToShows < ActiveRecord::Migration
  def change
    add_column :shows, :artist_name, :string
  end
end
