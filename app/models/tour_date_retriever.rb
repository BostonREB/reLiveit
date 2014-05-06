class TourDateRetriever

  def initialize(artist)
    @artist = artist
  end

  def get_tour_api_data
    remote = Songkickr::Remote.new "hE5bvaHdNvEf3Tb4"
    performances = remote.events(artist_name: @artist.name)
    save_tour_dates(performances)
  end

  private
  attr_reader :artist

  def save_tour_dates(shows)
    shows.results.map do |event|
      next if check_event_unique(event)
      Show.create(show_params(event))
    end.compact
  end

  def check_event_unique(event)
    Show.where(songkick_id: event.id).exists?
  end

  def show_params(event)
    {
      date: event.start,
      uri: event.uri,
      songkick_id: event.id,
      artist_id: artist.id,
      city: event.location.city,
      venue: event.venue.display_name
    }
  end
end
