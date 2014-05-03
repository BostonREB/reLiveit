class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @events = get_artist_tour_dates(@artist)
    @recordings = get_recordings(@artist)
  end

private

  def get_artist_tour_dates(artist)
    remote = Songkickr::Remote.new "hE5bvaHdNvEf3Tb4"
    remote.events(artist_name: artist.name)
  end

  def get_recordings(artist)
    artist_name = artist.name.gsub(" ","+")
    raw_data = HTTParty.get("http://archive.org/advancedsearch.php?q=#{artist_name}+%26+2014&fl%5B%5D=collection&fl%5B%5D=date&fl%5B%5D=identifier&fl%5B%5D=title&sort%5B%5D=&sort%5B%5D=&sort%5B%5D=&rows=50&page=1&indent=yes&output=json")
    recordings = raw_data['response']['docs']
    recordings.shift
    recordings
  end
end
