class RetrieveTourDate

  def initialize(artist)
    @artist = artist
  end

  def get_tour_api_data
    remote = Songkickr::Remote.new "hE5bvaHdNvEf3Tb4"
    remote.events(artist_name: @artist.name)
  end
end
