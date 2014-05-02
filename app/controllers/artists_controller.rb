class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @events = get_tour_dates(@artist)
    @shows = get_shows
  end


private

  def get_tour_dates(artist)
    remote = Songkickr::Remote.new "hE5bvaHdNvEf3Tb4"
    remote.events(artist_name: artist.name)
  end

  def get_shows
    raw_data = HTTParty.get('http://archive.org/advancedsearch.php?q=drive-by+truckers+%26+2014&fl%5B%5D=date&fl%5B%5D=identifier&fl%5B%5D=title&fl%5B%5D=year&sort%5B%5D=&sort%5B%5D=&sort%5B%5D=&rows=50&page=1&indent=yes&output=json')
    shows = raw_data['response']['docs']
    shows.shift
    shows
  end
end
